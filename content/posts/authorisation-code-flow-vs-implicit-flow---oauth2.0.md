---
title: "Authorisation Code Flow vs Implicit Flow - Oauth2.0"
date: 2020-07-23T08:14:11+05:30
draft: true
---

* Auth code flow, token exchange happens on the back channel
* Implicit flow is for SPAs and happens on the front channel
  *  Auth server needs to procide the CORS settings to allow requests to get a token
  *  Only with client ID, no client secret is required. public clients
  * You are exposed to attacks since it is very likely for the token to be intercepted by a browser plugin or a tool that sits inbetween your browser and the auth server
  * Talk about PKCE as a solution
