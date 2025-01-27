---
title: "Game Dev Update - Getting into Godot!"
permalink: /blog/godot-update.html
---

I'm going to document a bit about what I've been doing since releasing [Psycho Box](/psycho-box.html).

After Psycho Box, and even while making Psycho Box, I kept wondering how faster I would be making games if I were using an engine, assuming I were good at using such engine.
Don't get me wrong, I'm no stranger to game engines. I've tried a lot of them in the past. But it's been a while. So my next goal was set: Learn Godot and make games in it.

## My Godot Adventures

I've known about Godot for a long time. There's a personal history between me and Godot. It originated in Argentina, where I live, and I even had a job that was primarily about Godot.
But even ignoring all that, I like Godot because it's relatively lightweight, fully open source, and malleable. It's so malleable that you get to pick which programming language to use for gameplay code. You can technically use C++ to code your entire game, but admittedly it's not very practical. So the two main options for scripting are GDScript and C#.

So that's what I've been doing mainly on my spare time, after releasing Psycho Box: Making stuff in Godot, mainly to get better at it. My first (failed) project was to clone an old Flash game I liked: [Sports Heads](https://www.youtube.com/watch?v=hYJ4EeE5hZ4). But even that proved too hard a task for me. I couldn't get the physics right. It was quite frustrating. So I decided to quit that project.

### Pew Pew Baba

After that, I decided to make the simplest game I could think of. A shoot-em-up, but with mobile controls, and endless. You only use two buttons to play the game: You can turn left, or turn right. You can be in one of three lanes. All you have to do is not get hit.

It turned out to be a great idea, because I managed to finish the project, and it was fun to make. Also, the game can be quite fun. Some people liked it, at least! Here's a link to the [Pew Pew Baba article](/pew-pew-baba.html). The game is on itch.io, if you wanna play it.

<iframe frameborder="0" src="https://itch.io/embed/2539667?linkback=true&amp;dark=true" width="552" height="167"><a href="https://lucypero.itch.io/pew-pew-baba">Pew Pew Baba by Lucy</a></iframe>

While making this tiny game, I learned a lot about basic things in Godot. So it was a great experience. I also learned a bit about how to make SFX, and a bit about music. My boyfriend taught me about sound, and he's the one who made the amazing
music track in the game! 🙂

### After Pew Pew Baba - C#

This is where things started slowing down. I started losing focus in my game dev activities, so I haven't made much progress in any project or in my game dev education.

Even before finishing Pew Pew Baba, I was interested in coding in C# instead of GDScript. So I slowly started doing it. I partially ported Pew Pew Baba to C#, then I started other projects in C#.
There's nothing wrong with GDScript. In fact, it's a really good dynamic scripting language. It's probably my favorite one. But I'll always be partial to statically typed languages. It will always feel better
to know that if the program compiles, then you are assured that there are no obvious mistakes in the code which will make the game crash at any moment. It also makes refactoring much easier, and stress-free.

So yeah, I've been learning a lot of C# lately. The language borrows a lot from C++, but it has its own quirks that you have to know about. For example, the difference between `struct` and `class` in C# is much more substantial than in C++.
I have used C# in the past in Unity, but that was years ago, so I had to re-learn many things. But I was up and running in no time.

### My JRPG project

I decided my next project to be a JRPG. I was never fully committed to it, I still am not, so maybe that's why I've been slowing down so much.

I was interested in learning how to code and structure the code and data of a JRPG (Japanese Role Playing Game). So this project is mainly for a challenge, and for technical curiosity. I don't think I am capable of making an actual JRPG that is remotely fun or interesting by myself. Not at this moment, at least.

So yeah, I even wrote some design documents about what the game will be. Honestly I didn't put much time into it, and I didn't make much progress. I'm kinda in a slump right now when it comes to my game dev adventure.

Might as well show a little bit of what I managed to put together. I started this project as a 3D/2D game, where the environments are in 3D and the characters are 2D. Then, I coded a basic turn-based combat system. It was challenging but eventually I managed. It's pretty cool, imo. Here's a video where the player is in the overworld, initiates a battle, then ends the battle and back to the overworld:

<video controls>
  <source src="/assets/videos/jrpg-3d-but-2d.mp4" type="video/mp4">
</video>

Then I decided to go back to 2D, to make it easier for myself. I started working on the Overworld part of the game. Here's you talking to NPC's:

<video controls>
  <source src="/assets/videos/jrpg-talk.mp4" type="video/mp4">
</video>

You get the idea. Nothing that is well developed. I haven't put in the time needed for this project.

### Closing Thoughts

Anyway, I am low on motivation lately. I hope I can find a hook that can bring me back at full energy. Whether it's in this JRPG project, or another. I will not totally commit to this project yet. If I have to drop it, I will. Because maybe it's
not the right project I should be working on right now.

There's a lot of technical challenges that I'd still love to tackle in this genre. Like how to store branching dialogue in a game like this, or how to store data about items and stats. It's interesting.

Anyway, here's where I'm at right now. It's not the best place to be, but that's how it is sometimes. I thought that it'd be cool to make the overworld in first person 3D, while being in a dungeon, ala Legend of Grimrock. So maybe I'll explore that.

Also, I'm interested in learning more specific areas of game development, rather than making a complete game. For example, I want to learn about character animation. To this day, I don't know much about that, and I feel like I should.
Also, I wanna get more into shaders, and 3D asset creation.

There's so much to learn. 😊
