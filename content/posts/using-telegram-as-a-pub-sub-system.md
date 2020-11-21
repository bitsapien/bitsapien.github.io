---
title: "Using Telegram as a Pub Sub System"
date: 2020-11-21T23:53:55+05:30
draft: false
toc: false
images:
tags:
  - technology
  - pub-sub
  - messaging
---

I'm a person who heavily relies on notes. I'm addicted to it.
You won't beleive it if I said I bought an iPhone for the sole reason to be able
to take notes on the go and sync it with the "Notes App" on my primary machine.

Ever since I noticed my over-reliance on this one tool to be at the center of my
life, it made me nervous. What happens when Mac decides to shut the Notes App?
What happens if Apple is secretly reading my notes?
What happens if Apple decides to change how "Notes" works fundamentally?


My response to all these risks was leading me into one direction: Decouple
myself with using Notes for everything. Reaching here has surely been a journey
for me, philosophically too!

```
The Problem Statement: Collect notes from my phone and save it to disk on my
primary machine.
```

The solution that struck my head was to use a database on my phone that
stores my notes and my primary machine (where all my notes live),
pulls and categorises it. Pretty simple, right?

Wrong. This would involve me to build something on iOS and then use the
phone's database or even one on the internet(which I would have to pay for) and
then writing a script to download all that and categorise it on my machine.
Does it realy have to be that complicated?

Then I thought I don't need a database, a pub-sub system running online will
just do the job. I will only have to figure out how to write to it.

Well that didn't "simplify" the solution by leaps and bounds, I was still not happy.
😏

I was having a random discussion about Telegram and it struck us that the
"Telebot" can actually double up as pub-sub system on the cloud and I could do
exactly what I intend to do.

Dedicated an hour, and I had my own note-taker ready. What did it take?


1. Creating a bot using the Telegram app on the phone.
2. Writing a tiny script to pull messages from the bot's inbox.
3. Add a cron that runs the script at regular intervals.

I used python for this and a library called [telepot](https://telepot.readthedocs.io/en/latest/)

The source code is pretty straight forward, very similar to how you would code a
basic a subscriber. [Go check out the code]()




