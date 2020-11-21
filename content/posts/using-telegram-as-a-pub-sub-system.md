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

### The Context
I'm a person who heavily relies on notes. I'm addicted to it.
You won't beleive it if I said I bought an iPhone for the sole reason to be able
to take notes on the go and sync it with the "Notes App" on my primary machine.

Ever since I noticed my over-reliance on this one tool to be at the center of my
life, it made me nervous.
- What happens when Apple decides to shut the Notes App?
- What happens if Apple is secretly reading my notes?
- What happens if Apple decides to change how "Notes" works fundamentally?


My response to all these risks was leading me into one direction: Decouple
myself with using Notes for everything. Reaching here has surely been a journey
for me, philosophically too!

### The Problem Statement
Collect notes from my phone and save it to disk on my
primary machine.

### Solutioning

The solution that struck my head was to use a database on my phone that
stores my notes and my primary machine (where all my notes live),
pulls and categorises it. Pretty simple, right?

Wrong. This would involve me to build something on iOS and then use the
phone's database or even one on the internet (_which I would have to pay for_) and
then writing a script to download all that and categorise it on my machine.
Does it realy have to be that complicated?

Then I thought I don't need a database, a pub-sub system running online will
just do the job. I will only have to figure out how to write to it.

Well that didn't "simplify" the solution by leaps and bounds, I was still not happy.
😏

Then I was having a random discussion about Telegram and it struck us that the
"Telebot" can actually double up as pub-sub system on the cloud and I could do
exactly what I intend to do.

### The Solution
Dedicated an hour, and I had my own note-taker ready. What did it take?

1. Creating a bot using the Telegram app on the phone which also gives you the
credentials._Hint: Find a contact called "Botfather" on Telegram_
2. Writing a tiny script to pull messages from the bot's inbox. _There's a
sample below._
3. Add a cron that runs the script at regular intervals.

I used `python` for this and a library called [telepot](https://telepot.readthedocs.io/en/latest/)

The source code is very similar to how you would code a basic subscriber.

```python
import telepot
import os
import subprocess

# Telegram bot inbox subscriber code
# ------------------------------------------------------
# This is an example script for a case where you want to
# store any hyperlinks you encountered in the wild.

bot = telepot.Bot(os.getenv('BOT_SECRET'))
# Telepot automatically acknowledges to Telegram that you
# have read all messages as part of the below request,
# and would only return "unread" messages next time.
# Yes, it is exactly like a pub-sub system!
messages = bot.getUpdates()

for message in messages:
    entities = message.get('message').get('entities')
    if entities:
        for entity in entities:
            if(entity['type'] == 'url'):
                url = message['message']['text']
                # Do some magic here with the url

```



---
_Came to this solution when talking to [sagerishi](https://github.com/sage-rishi) Thanks!_


