---
title: "Pull Request or TBD"
date: 2020-06-14T15:41:17+05:30
draft: true
---

PR based model vs TBD


I've worked in a PR based model for 3+ years for now (including 1 year at TW). Trying to summarise things - 

*Problems with MR/PR based model*
1. _Short lived feature branches_ - I had this issue earlier when I'd develop the complete feature in one feature branch and open up a huge PR to merge it. Like @Kapil Dube mentions, this would lead to no proper code review. Though with time I learned to create smaller PRs (slicing at a task level) for the feature I'm working on. I've never faced problems with this approach until when a fresher (fresh out of college) walks in, and they need to be taught this all over again. Also, merging PRs needs to be actively taken care of.

2. _Not "really" doing CI_ - I did not quite understand what this would mean. Having smaller PRs and merging them continuously would also be doing CI. Correct me if I'm wrong.
3. _Dev needs to switch context_ - We as developers switch context all the while. Moreover, the value you gain is that you have a better understanding of what code other's write and we learn as well.
4. _It slows down the process_ - I can't argue for or against this, I've never done TBD but I feel this is very subjective and cannot be argued upon as well.
5. _Branch gardening_ - We might need to do branch gardening even when we do TBD (if syncing your feature branch with master is what you mean by branch gardening)
6. _Lack of trust on tests/pipeline_ - Would that change according to the model you choose ? I do not think that would be affected. You’d only merge your code when the pipeline is green, the only difference is that it now happens on the CI instead of your local machine.
7.  _Control_ - This is true about PR based models, especially with the concept of ”code owners” who act as gatekeepers. This creates hierarchy, and I cannot build an opinion in my head on whether it is good or bad. Thinking of this differently, it ties back to trust, especially in a case where you have young devs, you’d need this control.
8. _Merge Hell_ - I feel this would be a problem in TBD as well. For example, this would happen if you probably sync with master and somebody did a painful refactor a while ago. It would break merge hell there too.
9. _Feature flagging not a pre-requisite_ - I have recently faced this problem, and I think TBD makes you more careful developer when it comes to pushing your code.

*Good things about PR based model*
1. _Low trust situations_ - This completely makes sense to me.
2. _Makes you very sure that two pairs of eyes have actually looked at the code_
3. _There is more collaboration_ - The question being are there other ways of collaborating on code other than reviews?

*Problems with TBD*
1. _Need a disciplined team or maybe tooling to keep builds green_ - This is a valid concern, but I feel this is a need in the above model as well.
2. _An absolute need for pair programming_ - This is true given the fact that we want a pair of eyes looking at our code to minimise bugs.
3. _Under more mental pressure_ - that you’ve not broken anything unless you have a tight test suite.

*Good things about TBD*
1. It forces you to follow certain best practices.
2. You avoid spats and rabbit hole discussions around things like coding styles.

*My conclusion from the above has been this:  Use PR based model in only a low trust situation.*
1. This would mostly mean it could be used when we begin a project from scratch with an entirely new team. This would help everyone learn and reach to a certain level where there is enough trust(in people, pipeline, and test suite) eventually and create the foundation for doing TBD
2. In a team that is already setup, the best way to do things is TBD but if a new dev walks in, we can enforce PR based reviews for them, and move them to TBD as trust builds.

PR descriptions in distributed teams
Composiotion of team, seniors cannot pair


Low trust environments vs high trust environments, give the Bob example
