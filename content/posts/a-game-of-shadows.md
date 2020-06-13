---
title: "A Game of Shadows"
date: 2017-10-09T20:51:44+05:30
draft: false
tags: ["stories"]
---


How Team Moriarty built the ultimate maze to befog the sherlocks in our team.

Goa was a couple of weeks ahead and an idea struck our technology lead. The idea was to treat the teams to a multitude of mind games. The constraints being that the players need to visit all our production applications and end on one candidate in the database.

This was the first time I was designing something like a treasure hunt. When I don’t know something, I either try to stick to already built frameworks or build one on my own. Sticking to a framework catalyses your progress as well as makes it measurable. For this case I couldn’t find any frameworks as such, and so I decided to build one on my own. Since each candidate in our database has a 7 digit candidate ID, I decided to split the hunt into finding 7 clues. With each clue one would be given the path to finding the next clue. Now that I had a framework and scaffolding ready, I now had to bring the scaffold to life.

I started to look at each application as a sandboxed region where I could hide a clue. I would plant a puzzle/task in each application that needed to be solved/performed. The consequence of performing or solving it correctly would yield the clue. 

The next challenge was to minimise human involvement, so that the hunt may run on auto-pilot. This had its own advantages, tracking events like completion of challenges, revealing clues and paths, and reducing conflict, thus guaranteeing fair play. So I wrote a bot for Slack(an awesome chat application) that could talk to players. The bots capabilities included showing the players instructions whenever they asked for it, reveal clues and paths, track which team solved a challenge when and sending them a song or two to lighten their mood. To avoid failures, I planned to have a human who could reply to things that the bot could not.

My idea was that we could theme the names and characters of the hunt around the name of the candidate we would choose as the ultimate prize.

We came up with a lot of ideas, from candidates who had applied to around 200 jobs, to candidates who are now founders, to candidates who had catchy names like “Narendra Modi”, “Rahul Modi”, “Rahul Gandhi”. We finalized on a guy names “Mahadev”, who had studied in Goa University (you know what we were thinking). 

Consequently, we named the bot - “Mahadev”. The human helper to “Mahadev” would be called “Ganesha”. The whole purpose of naming that way was to create a “Aha!” moment for the players. 

