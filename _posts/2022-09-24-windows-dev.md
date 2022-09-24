---
title: "Programming In Windows and how to make it Great"
permalink: /blog/windows-development.html
---

I will show you how to have a great time programming in Windows. Personally, I'd say the experience is much better than on Linux after you learn some of the tricks.

<!--more-->

After a few years after switching from Linux, I was forced to learn how to develop on Windows without being miserable. At first I thought it was going to be hell but after a while, I realized it's actually pretty good. Things actually have a much higher chance of working than on Linux, which is great. GUI's in general are much better too.

This article will be about showing you all the things I use to make my programmer experience on Windows enjoyable. I will split all the things I use by category:

## Software Development

### Code Editor: Sublime Text

I have used many, many editors. To name a few: Emacs, Vim, Neovim, Atom, 4coder, VS Code. By far, the editor that has the best *feel* out of all of them is [Sublime Text](https://www.sublimetext.com/). It's the fastest one there is, and it is also extremely powerful. I won't talk much about it here because I'll probably make an article dedicated to it, but it's just amazing after you learn a bit about how to customize it and how to make it work exactly as you want it to. As for package recommendations, there's NeoVintageous for vim bindings, LSP to use LSP Servers, and Origami for Pane management.

### IDE: CLion

If you need a more heavy duty tool for code editing and navigation, there's nothing better than Jetbrains IDE's. [Clion](https://www.jetbrains.com/clion/) is really, really good for C++ and Rust development (with the official Rust plugin). It has every tool imaginable for software development out of the box, and somehow it still manages to be intuitive and fast. I recommend using the Vim plugin here too, of course :stuck_out_tongue:

### Git GUI: Sublime Merge

[Sublime Merge](https://www.sublimemerge.com/) makes working with Git intuitive and enjoyable. Do I need to say more?

## The Command Line

### Terminal Emulator: Windows Terminal

Windows Terminal is actually a pretty good terminal emulator. It has all the features I need, like tabs and splits. I use it for all my command line needs. It is very customizable, too. And it comes with Windows 11!

### Shell: Nushell

When it comes to using the terminal, *speed* is my main priority. `cmd`, the default Windows shell, is pretty fast, but unfortunately it is really bad and has no features :joy:. Microsoft's attempt to make a good shell is Powershell. I have used Powershell for a few months. It is very capable and impressive in many regards. Unfortunately, it is *extremely slow*, so I started looking for alternatives. And so I found *Nushell*.

[Nushell](https://www.nushell.sh/) is a super powerful, multi-platform shell. It is very easy to script for it, too. It has its own scripting language, but it is very easy to get started and it is so much better than shellscript, anyway.

Most importantly, it is super duper fast. Since nushell, I have not looked back at Linux for the shell experience. I used to think Linux was superior in that regard until I started using Nushell. I strongly recommend it.

### CLI programs

I strongly recommend `scoop` for package management (mentioned later). There's also `fzf` and `lf`.

### Package management: Scoop

Who said Windows has no package managers? [Scoop](https://scoop.sh/) is an awesome one. It has every program you could think of, and they are all updated to their latest version. It is a pleasure to use. You could probably `scoop install` every program mentioned here.

Other alternatives are [chocolatey](https://chocolatey.org/) and [winget](https://winget.run/).

## Programs and tips for Desktop navigation

- [Everything](https://www.voidtools.com/-) is a program that lets you search any file, anywhere in the system, extremely quickly.
- Turn off all OS animations. It makes everything feel so much faster.
- If you are on Windows 11, I recommend using [this](https://github.com/valinet/ExplorerPatcher) so you can use the superior Windows 10 taskbar.
- [Powertoys](https://github.com/microsoft/PowerToys) is a set of programs written by Microsoft that help you get around Windows like a power user. Specifically, I found Powertoys Run to be really useful for fast navigation. I've heard great things of FancyZones too.
- If Powertoys doesn't feel powerful enough, [AutoHotkey](https://www.autohotkey.com/) is a really nice program that lets you run scripts that can do pretty much anything at the OS level.
- Edge is good, actually. I've been maining it for a while now. Give it a chance! :smile:
- [OneCommander](https://www.onecommander.com/) is a good third-party file browser. The Windows file browser is garbage and slow, but thankfully there are many alternatives like OneCommander and [QTTabBar](http://qttabbar.wikidot.com/). Sidenote: The Windows file browser still does not have tabs. Microsoft seems to have trouble implementing tabs. I think they've been going at it for many years and they still couldn't do it. Who knows, maybe tabs are one of the hardest challenges in programming.

## Other good programs

- [mpv](https://mpv.io/) for video playback

## Oh and also, Windows is the best at everything else, too.

For PC Gaming, there's really nothing else. And for casual use, it's pretty good too. I tried getting my mom into Linux one time, it did not end up well.

## Final Thoughts

I will probably modify and add to this article as time goes on. For now I think this covers most things. Enjoy your time programming in Windows. You will see that it's not that bad after all.
