# -*- coding: utf-8 -*- #
# frozen_string_literal: true

require 'rouge'

module Rouge
  module Lexers
    class Odin < RegexLexer
      title 'Odin'
      desc 'The Odin programming language (odin-lang.org)'
      tag 'odin'
      aliases 'odinlang'
      filenames '*.odin'
      mimetypes 'text/x-odin'

      def self.keywords
        @keywords ||= Set.new(%w(
          asm auto_cast bit_field bit_set break case cast continue
          defer distinct do dynamic else enum fallthrough for foreign if
          import in map matrix not_in or_break or_continue or_else or_return
          package proc return struct switch transmute typeid union using
          when where
        ))
      end

      def self.keyword_constants
        @keyword_constants ||= Set.new(%w(true false nil))
      end

      def self.builtin_types
        @builtin_types ||= Set.new(%w(
          bool b8 b16 b32 b64
          int  i8 i16 i32 i64 i128
          uint u8 u16 u32 u64 u128 uintptr
          i16le i32le i64le i128le u16le u32le u64le u128le
          i16be i32be i64be i128be u16be u32be u64be u128be
          f16 f32 f64
          f16le f32le f64le
          f16be f32be f64be
          complex32 complex64 complex128
          quaternion64 quaternion128 quaternion256
          rune string cstring rawptr
          any typeid byte
        ))
      end

      def self.builtin_procs
        @builtin_procs ||= Set.new(%w(
          len cap size_of align_of offset_of offset_of_selector
          offset_of_member offset_of_by_string type_of type_info_of
          typeid_of swizzle complex quaternion real imag jmag kmag conj
          expand_values min max abs clamp soa_zip soa_unzip raw_data
          container_of
        ))
      end

      id = /[\p{L}_][\p{L}\p{Nd}_]*/

      state :root do
        rule %r/\s+/, Text
        rule %r(//[^\n]*), Comment::Single
        rule %r(/\*), Comment::Multiline, :nested_comment

        # Compiler directives like #force_inline, #+build linux
        rule %r/#\+?#{id}/, Comment::Preproc

        # Attributes: @(private), @(export), @export, etc.
        rule %r/@/, Name::Decorator, :attribute

        # Sentinel for default values
        rule %r/---(?!-)/, Keyword::Constant

        mixin :literals

        # Strings (kept before identifiers so that backtick raw strings work)
        rule %r/"/, Str, :string
        rule %r/`[^`]*`/, Str
        rule %r/'/, Str::Char, :char

        # Identifier: classify against keyword/builtin sets, with a lookahead
        # for `(` to detect call sites.
        rule %r/(#{id})(\s*)(\()?/ do |m|
          name = m[1]
          if self.class.keywords.include?(name)
            token Keyword, name
            token Text, m[2] if m[2] && !m[2].empty?
            token Punctuation, m[3] if m[3]
          elsif self.class.keyword_constants.include?(name)
            token Keyword::Constant, name
            token Text, m[2] if m[2] && !m[2].empty?
            token Punctuation, m[3] if m[3]
          elsif self.class.builtin_types.include?(name)
            token Keyword::Type, name
            token Text, m[2] if m[2] && !m[2].empty?
            token Punctuation, m[3] if m[3]
          elsif name == 'context'
            token Name::Builtin, name
            token Text, m[2] if m[2] && !m[2].empty?
            token Punctuation, m[3] if m[3]
          elsif m[3]
            tok = self.class.builtin_procs.include?(name) ? Name::Builtin : Name::Function
            token tok, name
            token Text, m[2] if m[2] && !m[2].empty?
            token Punctuation, m[3]
          else
            token Name, name
            token Text, m[2] if m[2] && !m[2].empty?
          end
        end

        # Operators / punctuation (longest alternatives first)
        rule %r/&&=|\|\|=|<<=|>>=|&~=|\.\.<|\.\.=/, Operator
        rule %r/->|<-|:=|<<|>>|<=|>=|==|!=|&&|\|\||&~|\.\.|\+\+|--|\+=|-=|\*=|\/=|%=|&=|\|=|\^=/, Operator
        rule %r/[+\-*\/%&|\^~!=<>?]/, Operator
        rule %r/[\[\](){}]/, Punctuation
        rule %r/[,;:.$]/, Punctuation
      end

      state :literals do
        # Hex float
        rule %r/0h[0-9a-fA-F_]+/, Num::Float
        # Float literals
        rule %r/\d[\d_]*\.\d[\d_]*(?:[eE][+\-]?\d[\d_]*)?[ijk]?/, Num::Float
        rule %r/\d[\d_]*[eE][+\-]?\d[\d_]*[ijk]?/, Num::Float
        # Integer bases
        rule %r/0b[01_]+[ijk]?/, Num::Bin
        rule %r/0o[0-7_]+[ijk]?/, Num::Oct
        rule %r/0d[0-9_]+[ijk]?/, Num::Integer
        rule %r/0z[0-9a-bA-B_]+[ijk]?/, Num::Integer
        rule %r/0x[0-9a-fA-F_]+[ijk]?/, Num::Hex
        rule %r/\d[\d_]*[ijk]?/, Num::Integer
      end

      state :nested_comment do
        rule %r([^*/]+), Comment::Multiline
        rule %r(/\*), Comment::Multiline, :push
        rule %r(\*/), Comment::Multiline, :pop!
        rule %r([*/]), Comment::Multiline
      end

      state :string do
        rule %r/"/, Str, :pop!
        rule %r/\\(?:[abfnrtv0\\'"]|x\h{2}|u\h{4}|U\h{8})/, Str::Escape
        rule %r/\\./, Str::Escape
        rule %r/[^\\"]+/, Str
      end

      state :char do
        rule %r/'/, Str::Char, :pop!
        rule %r/\\(?:[abfnrtv0\\'"]|x\h{2}|u\h{4}|U\h{8})/, Str::Escape
        rule %r/\\./, Str::Escape
        rule %r/[^\\']+/, Str::Char
      end

      state :attribute do
        rule %r/\(/, Name::Decorator, :attribute_args
        rule %r/#{id}/, Name::Decorator, :pop!
        rule(//) { pop! }
      end

      state :attribute_args do
        rule %r/\)/, Name::Decorator, :pop!
        rule %r/"/, Str, :string
        rule %r/[(,=.]/, Name::Decorator
        rule %r/\s+/, Text
        rule %r/#{id}/, Name::Decorator
        mixin :literals
      end
    end
  end
end
