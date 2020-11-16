### Info

Resume
```
https://gist.github.com/bitsapien/f5776aa63c6f637eccf8017b5096e8d9
https://registry.jsonresume.org/bitsapien
~/Dropbox/Resume/RahulChinta-Resume-Oct-2020.pdf
```

Name
```
Rahul Chinta
```

Email
```
bitsapien@gmail.com
```

Linkedin
```
https://linkedin.com/in/cspacerahul
```

Github
```
https://github.com/bitsapien
```

----
## Job applications

### Baleno
Date: `Sun Oct 25 13:55:56 2020`
Link: https://apply.workable.com/balena/j/8BF6036D98/apply/?autofill


**What country do you live in (or plan to live, since you can work remotely)?**
I live in India, I'd love to move to a country in Europe and work from there.

**What specifically excites you about this role and what would you bring to this team?**
Software delivery to IOT devices would be a completely different ball game than what I have been doing traditionally. Speedening/Improving software delivery and working for what I call "developer experience" is something I'm deeply passionate about. Understanding pain points of devs and then solving them has been kind of my full time job since the whole of last year.

**What's a complex technical project you have worked on and feel proud of? Help us understand what you did, what you learned, and what about it was satisfying to you.**
A team of 3 people were given the task to enable 7 autonomous teams to deliver their resources to customers. This needed that we have an API Gateway as well as a micro-frontend system in place. This was being intially done using Varnish and HAProxy and this led to a lot of maintenance overhead as well as unnecessary complexity. The CI/CD workflows were also semi automated and broken. We switched to Kong that helped us to move away from both Varnish and HAProxy, and since Kong is backed by Nginx, configuring and maintaining it was way simpler than running the Varnish setup.
We fixed all of the above and I also built an email wrapper over AWS SES to send mails to customers. The service is now being used to send 1000s of email every month.


### Testlio
Date: ?
Link: ?

**Microservices architecture**

* I was part of a team that had designed and executed a migration of Ruby on Rails monolith to a microservice. This included implementing the command pattern to start with. I'd love to go deep into the strategy used here but that would go slightly beyond the scope of this email.
* My recent project had around 4 products being handled via a combination of around 9 services.
* My current project that I've inherited from an old team, has 5 services, a RabbitMQ and a Postgres DB running on Kubernetes.
* I used a combination of SQS and SNS to enable message brokering for one of our services that is built around an almost stateless lambda function. I've worked with a different project where we did use REST based communication as well as GraphQL.
* The services we built from scratch had their own databases, whereas the project I did around the migration (mentioned in the first point) had a shared DB.
* In microservices we've would use plain RBAC. These roles would be part of the JWT that the client would pass to the backends.

**Frontend**

* I've worked with React where I was tasked to create an interface to book appointments with doctors. This is where I had to integrate with a GraphQL BFF. The project had React + Apollo(state sync) + recompose (state management). I also used react-testing-library and cypress to test the components developed.
* I used an internal component library that was provided for applications built by this company. The library did have a lot of problems especially around the "generic-ness" side of things. I improved a few of the components I was directly using.
* I've worked on providing some internal tooling for the portal I'm working with that includes an error collection system that reports errors back to Splunk when an uncaught exception bubbles up to the window object.

**Backend**

* I've attempted a correction and optimization of a query we used to rank people according to a score. The number of scores in the table were around 600000.
* There was a need to store versioned data but we never arrived on a solution back then, but I recently discovered crux that I'm playing around with to understand if this versioning can be achieved with DBs.

* I've briefly worked with the Varnish cache and I tried understanding it, though I've never had a use case to implement  one yet.
