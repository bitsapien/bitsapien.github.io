---
title: "The Case for Dom Testing Library"
date: 2020-10-29T17:35:57+05:30
draft: true
toc: false
images:
tags:
  - testing
  - frontend
---


What do I want to acheive from this talk ?

- Make a promise
  - I will attempt to introduce you to a tool to make your testing lives easier.
- Highlight the challenges we already face.
- Convince folks the right way to think about testing UI.



Principles in Testing
- Do not mock
- Do not test implementation
- Tests are about gaining confidence


Presenter Notes


So we can sleep well at night.  We want to know a bug would not break production, especially when you are doing continuous delivery.
It gives you that confidence on your code
It is easier to get hold of a bug locally than getting a call at 2am in the morning to fix it.
The idea is to test the business logic.
So, how do we see this?
Should we have 100% code coverage ? Yes and No.

Test only enough, else you end up testing code you don't need to test. give an example
You find yourself testing implementation details when you do the above.

Rule being, you rarely need not have to change tests when refactoring code.

What are the different tests we have
unit
integration
end to end

Show the pyramid

Show a note from Martin Fowler on the end

Argue about the missing piece - confidence.

Integration tests strike a great balance on the trade offs between confidence and speed, this is the reason there is value in spending your time there.
The line between unit test and integration tests can get fuzzy so simple rules:
Stop mocking as much as you can - don't mock away integration between your components, mock away integration with side effects in the outside world
not mocking increases your confidence in the tests. There is no false sense of security.
Do not test implementation details.

Explain the tech stack I used with ReactJS

How many of you know about Enzyme ?
- Enzyme’s testing methods promotes mocking, which is dangerous. - show example.




