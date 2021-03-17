---
title: "OAuth 2.0"
date: 2021-01-25T16:07:44+05:30
draft: false
---

### What problem does OAuth2.0 solve ?

OAuth2.0 enables third-party client applications to gain delegated access to an
end user's data and actions without having to share the end user's credentials
to the third-party client application.

### How it works?
The basic flow involves the client application to request authorization from the
resource owner, which is usually in the form of a token. This token can then be
used by the client application to "do" things on behalf of the resource owner.

{{< image src="/img/oauth-20.png" position="center" >}}

### Terminology

1. **Client Application**

   The third-party application that wants to consume the resources exposed by a
   resource server or a group of them.
2. **Resource Server**

   The server whose resources are being exposed and need to be protected.
3. **Resource Owner**

   The owner of a particular resource in the resource server.  This is also
   known as the end user.
4. **Authorization Server**

   The server that protects the resources of the resource owner and facilitates
   the delegation of access to the client application.

