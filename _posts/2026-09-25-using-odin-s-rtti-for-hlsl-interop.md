---
title: "Using Odin's RTTI for Shader Interop"
permalink: /blog/odin-hlsl-interop.html
tags: programming odin
---

Odin's [RTTI](https://pkg.odin-lang.org/core/reflect/) (Runtime Type Information) features can be very useful if you're working with graphics API's. I made a quick little proc that checks if a given struct would match in layout with a Constant Buffer in HLSL:

```odin
// Checks if a given struct would align the same way in an HLSL's constant buffer
is_struct_aligned_to_cbuffer :: proc(cb_type: typeid) -> bool {

	if reflect.align_of_typeid(cb_type) != 256 {
		lprintfln("Constant buffer struct needs an alignment of 256")
		return false
	}

	current_hlsl_offset: int

	for i in 0..<reflect.struct_field_count(cb_type) {
		sf := reflect.struct_field_at(cb_type, i)
		field_size := sf.type.size

		// if it's more than 16 bytes, just align it to the row
		if field_size > 16 {
			align_to(&current_hlsl_offset, 16)
		} else {
			// If it's a basic scalar type... align it to the type alignment
			if is_basic_scalar_type(sf.type) {
				align_to(&current_hlsl_offset, field_size)
			}

			offset_start := current_hlsl_offset
			offset_end := current_hlsl_offset + field_size

			if offset_start / 16 != (offset_end - 1) / 16 {
				// crosses row boundary. add padding so it starts at next row.
				current_hlsl_offset += 16 - (current_hlsl_offset % 16)
			}
		}

		if cast(int)sf.offset != current_hlsl_offset {
			lprintfln("Field: %v is misaligned.", i)
			return false
		}

		current_hlsl_offset += sf.type.size
	}

	return true
}
```

(Note: This is very incomplete. This code will not predict exactly how the struct would get laid out in HLSL. But even in this form, it's very useful for me. I might improve it in the future)

This is very useful, as nothing will warn me otherwise if the struct's layout does not match its HLSL counterpart. Nasty bugs thus occur. I check this when creating a Constant Buffer, where an Odin struct type is passed:

```odin
// created buffer on the upload heap, and maps it. keeps it mapped
cb_upload_create :: proc(cb_type: typeid, pool: ^DXResourcePool, name: string = "") -> ConstantBufferUpload {
	assert(is_struct_aligned_to_cbuffer(cb_type), "CONSTANT BUFFER STRUCT IS MISALIGNED!")

	/// rest of the proc
}
```

The HLSL code for the struct is auto-generated from the Odin Struct. So I only have to write it once.

```odin

GeneralConstants :: struct #align (256) {
	view: dxm, // Row 0-3
	projection: dxm, // Row 4-7

	// Row 8
	inv_screen: v2, // 1.0 / (width, height)
	screen: v2,

	// Row 3
	sb_sprites_idx: u32, // index of the sprite structured buffer into the resource heap
	tx_idx_quad_out, tx_idx_post_process_out: i32,
}

/// ...

ldx.dx_generate_hlsl_types({Sprite, GeneralConstants}, "shaders/gen/lucy2d-structs.gen.hlsl")
```

This code is generated from that:

```c
struct GeneralConstants {
	float4x4 view;
	float4x4 projection;
	float2 inv_screen;
	float2 screen;
	uint sb_sprites_idx;
	int tx_idx_quad_out;
	int tx_idx_post_process_out;
};
```

You can then `#include` this file in other HLSL files.

The layout for constant buffers in HLSL is very particular. You can only check that a struct is aligned in this particular way with something like Odin's RTTI. [This](https://maraneshi.github.io/HLSL-ConstantBufferLayoutVisualizer/) is a very good resource that helped me understand how constant buffers are laid out.

As an aside: I also generate the Vertex Input layout from an Odin Struct, in `pso_create`

```odin
// vertex buffer
Vertex :: struct {
	pos: v3 `POSITION`,
	normal: v3 `NORMAL`,
	tangent: v4 `TANGENT`,
	uv: v2 `TEXCOORD`,
	uv_2: v2 `TEXCOORD_SECOND_UV`,
}

// ...
ct.psos[.GBuffer_Pass] = pso_create(gbuffer_shader_filename, &ct.root_signatures, &g_resources_longterm, PSOParameters {
	vertex_input = Vertex,
	/// Rest of call.
)
```

The Input Layout for the vertex shader is auto-generated from the Odin Struct.

Though on my new 2D engine, so far I have not needed any kind of Vertex Input Layout. I render sprites by vertex pulling. 

You can read all this code in-context [here](https://github.com/lucypero/lucydx12)
