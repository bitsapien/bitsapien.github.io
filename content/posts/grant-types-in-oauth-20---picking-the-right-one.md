---
title: "Grant Types in Oauth 20 - Picking the Right One"
date: 2021-01-25T10:54:41+05:30
draft: true
toc: false
images:
tags:
  - technology
  - authentication
  - authorization
---


In a recent assignment, I had the task to decide upon an AuthX
(authorization/authentication) strategy for a team that exposes resources to
other internal teams.

These internal teams would have human and business users trying to write and
read from the resources exposed and managed by this team. Access to these
resources would be restricted based on which team a particular user belongs.
Our natural choice was to use OAuth 2.0

If you are not familiar with OAuth 2.0, I'd recommend you to read this
[short introduction](https://blog.bitsapien.dev/notes/shorts/oauth-20/).

One of the most important aspects in thinking about AuthX strategy is to choose
the correct grant types based on the client needs.

Grant types specify how to obtain authorization for a resource. The resulting
artifact is a token that the client application can use to make actions on the
target resource.


## Client Credentials

This becomes relevant for cases when you do not care about delegation, and you
intend to do a machine to machine authentication that has nothing to do with
resource owners.

The client exchanges their credentials (an ID and a secret) in exchange for a
token.

## Resource Owner Password

This is where the resource owner and consequently delegation becomes relevant.
The client would ask the authorization server to authenticate the user using
their username and password and get a token on behalf of the user that the
client can then use to perform actions.

The client would exchange their credentials (an ID and a secret) along with the
username and password of the resource owner for a token.


## Refresh Token

 This is relevant for
