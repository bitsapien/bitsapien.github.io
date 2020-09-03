---
title: "Yet Another Attempt at Understanding Auth"
date: 2020-07-19T11:35:55+05:30
draft: true
---


One of the most confusing and equally important pieces in software for me has been understanding authentication and authorization protocols.

These protocols have evovled over time and organisations have used it in various combinations which add to the confusion.

Let's take a look at how an industry standard auth flow called OAuth2.0 with OpenID Connect work.

![OIDC + OAuth2.0 + HTTP stack](/oauth2-oidc-stack.png)

We can start with an example where imagine that you run a software service for a bank that allows users to do transactions and view their balance. 

There is an external application that sells a service to show bank users their statistics on their spending in the last one month. This, the application can acheive only by looking at the transaction histry of the user.

There are two ways to solve this.
1. Ask the bank user to share their bank account credentials and promise the user that they wouldn't do antyhing else.
2. Give the foriegn application restricrted read access to the bank account transactions only.

The first approach is extremely risky and needs the user to trust this new foriegn application.

On the other hand, the restricted access provided by the bank to onl data the app needs is more trustable and less risky.
How do you acheive this ?

This is an authorization problem and has already been solved by something called OAuth 2.0

How does this work ?

![Oauth2.0 Authorisation Flow](/oath2-flow.png)

1. The foriegn app registers with the bank as a client.
   It needs to provide it's name, what permissions it needs from the user and something called a "redirect-uri"(imagine this to be a )


