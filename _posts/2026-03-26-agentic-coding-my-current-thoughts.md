---
title: "Agentic Coding - It's not that simple."
permalink: /blog/agentic-coding.html
---

I've been using Claude Code extensively at work and for little experiments on my own time. I'm here to reflect on my experiences.

My opinions on Agentic Coding are wildly fluctuating still, but these are my thoughts right now, at least.

We've been using Claude Code for about a month to make Unity games. The idea was to let the model do all the coding. We just manage it. Some coworkers like to run many instances at once. I haven't found that to be helpful, personally. What I often do is have a file with a checklist of tasks. I have Claude read it and interview me about all the tasks, and then I let it work. It works OK in most cases.

# Early experiences

When I started using this, I was amazed. I was so pro agentic coding. It seemed magical. You just tell it what to do and it does it. It accelerated work by so much. The problems only come later when the project grows and you need to start understanding the code. You should not let this tool do the thinking for you. You need to at least know how it's architecting things. Otherwise, it's gonna bite you later. I also found it to not be consistent: It sometimes manages to solve relatively complex problems on the first try, no problem. But then it gets stuck with really simple tasks. It's really strange.

# The Alignment Problem

I discovered that Claude Code and probably all other commercial LLM's have a problem with following directions and guidelines. They will follow whatever training they got and not take your guidelines into account. It was really hard for me to mold its coding style to my liking, even with simple things.

We code in Unity C# at work. I tried super hard to make it STOP null checking everything. Doing this is very bad as it makes the code much harder to read, longer, and it turns bugs "silent". As in: If something that should not be null is actually null, the code would fail silently with Claude's null checks. No exceptions thrown. Just nothing. This is really bad for debugging.

I tried so hard to make it NOT null check. I wrote clear guidelines in the Claude.md file. I had an intervention session with Claude explaining this issue. I introduced checks in pre-commit hooks and in claude's tool usage. It still constantly tries to do the null checks. It tries to bypass checks. It rationalizes useless null checks.

I find this to be a huge fundamental problem with this technology, as the model that you get is "frozen". The training is already done. You can't train it yourself. If we can't mold AI behavior to our liking, it's going to be very limited. I'm not a LLM engineer so I don't know what the solution for this should be.

# The Dangers

The more you use this, the more you depend on it. The less you know the codebase. The more useless you become as the engineer of the project. I find this to be very dangerous. It's inevitable that there's going to be a point where the project will get too big and convoluted for you to make changes and additions productively. The AI will not be able to cope with the project's complexity, eventually. And there's a risk that your project will fail. I think this should be talked about more.

I found that it often writes code in a very unnecessarily convoluted way. Code that is spread out across functions and files that should all be in one place. Code that could be much shorter. Also, it introduces dangerous bugs. I made it code a small Odin project. I was very impressed by it at first, but then I looked at the code and it's not pretty. It also introduced a very basic use-after-free bug. Something that an experienced Odin programmer would never do.

This tool is still very useful but it should be used with caution: Make sure you understand the high level view of the systems that you are making, at least. Read the code it writes. Order the AI to refactor it periodically so it's simpler.

The fact that, in general, advocates of these tools never talk about the limitations of this technology is very concerning to me. No, they cannot replace an engineer (at least not me). It's just a tool with strengths and weaknesses. It should always be seen as this, instead of some magical thing that replaces human minds.

# It's excellent for "grunt work" and tooling

I found this tool to be most suitable for "boring" tasks. Create new scripts and prefabs. Handle commands. Write small scripts that do a very specific thing. It's great for that and it saves you so much time, for the things that you don't really want to do, are not interesting, and don't impact the project's architecture in a high level way. It's also great for setting up the boilerplate for new systems, as long as you are the one deciding how this system is implemented.

One of its strengths is tooling creation. We make it do custom tooling for our games in Unity, and it's fascinating. It often gets it right the first try. And we get really useful tooling to develop content in our games. Plus, it's code that doesn't have to ship to clients, so you can "let it rip" with minimal worrying. It's a perfect application for this technology.

# Current aversion

As of now, I feel an aversion to agentic coding. It's much more fun for me to do the coding myself. I know how to make the code simpler and less error prone. It's just better in many cases. But agentic coding can still accelerate a lot of work in a project, for sure.

# Conclusion

It can be great. But it's just a tool. Use it for what it's good for and not for anything else. Don't let it *think* for you as that will lead to disaster.
