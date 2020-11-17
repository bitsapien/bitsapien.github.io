---
title: "Commands and Events"
date: 2020-11-16T21:59:21+05:30
draft: true
toc: false
images:
tags:
  - technology
  - queues
---


When we design solutions for our systems it can get really confusing

* The differences between commands and events.
* You need not have replay-ability for commands(since they may not be idempotent), events are can be replayed.

* Events are like FYIs
* Commands are like conveyor belt items waiting ot be picked up

* Commands expect a subscriber
* Events really dont care.


* Events - SNS
* Commands - SQS

* Message queuing
* Pub / Sub

