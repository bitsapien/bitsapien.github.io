---
title: "Pull Request or TBD"
date: 2019-09-14T15:41:17+05:30
draft: false
tags:
  - technology
  - software delivery
---

I've worked in a PR based model for 3+ years for now (including 1 year at TW).
It is time for me take a critical look at these 2 approaches.

### MR? PR?
* PR - Pull Request _Something that you would find in Github_
* MR - Merge Request _Something you'd find in Gitlab_


### Arguments I've heard against the MR/PR based model
1. **Long lived feature branches**

    I had this issue earlier when I'd develop the complete feature in one
    feature branch and open up a huge PR to merge it. This would lead to poor
    code review because of the sheer size of the PR. Though with time I learnt
    to create smaller PRs (slicing at a task level) for the feature I'm working
    on. I see this as a valid concern but we could still work around it.

2. **Not "really" doing CI**

    Continuous integration is all about sending out smaller
    (in some cases feature flagged) units of changes to production. The whole
    feature branch model dis-allows that.

3. **Developer needs to switch context when reviewing**

    We can all agree that context-switches can get tiring. The trade-off is
    that you get an opportunity to know your codebase better.

4. **It slows down the process**

    I can't argue for or against this, I've never done TBD but I feel this is
    very subjective and cannot be argued upon as well.

5. **Frequent Branch gardening**

   We might need to do branch gardening even when we do TBD (if syncing your
   feature branch with master is what you mean by branch gardening)

6. **Lack of trust on tests/pipeline**

   Would that change according to the model you choose ? I do not think that
   would be affected. You’d only merge your code when the pipeline is green,
   the only difference is that it now happens on the CI instead of your local machine.

7.  **Control**

    This is true about PR based models, especially with the concept of
    ”code owners” who act as gatekeepers. This creates hierarchy, and I cannot
    build an opinion in my head on whether it is good or bad. Thinking of this
    differently, it ties back to trust, especially in a case where you have
    young devs, you’d need this control.

8. **Merge Hell**

    I feel this would be a problem in TBD as well. For example, this would
    happen if you probably sync with master and somebody did a painful refactor
    a while ago. It would break merge hell there too.

9. **Feature flagging not a pre-requisite**

   I have recently faced this problem, and I think TBD makes you more careful
   developer when it comes to pushing your code.

### Good things about PR based model
1. **Low trust situations and poor CI/CD**

    When you really do not trust your CI/CD steps or the expertise of the team that
    you are working with.

2. **Makes you very sure that two pairs of eyes have actually looked at the code**

    This is generally true, given you know folks in the team are attentive
    enough to code smells and standards.

3. **There is more knowledge sharing**

    Given that there are not only a select few in the team who do code reviews.

### Problems with TBD
1. **Need a disciplined team or maybe tooling to keep builds green**

    This is a valid concern, but I feel this is a need in the above model as well.
    A need to maintain a stronger test suite that gives you greater confidence.
    IMO this is more a win and creates more discipline in the team.

2. **An absolute need for pair programming**

    This is true given the fact that we want a pair of eyes looking at our code
    to minimise bugs and keep code quality intact.

### Good things about TBD
1. It forces you to follow certain best practices and keep your test suites strong.
2. You avoid spats and rabbit hole discussions around things like coding styles.
   It greatly reduces intra team conflicts.

### My conclusion:  Use PR based model in only a low trust environment.
1. This would mostly mean it could be used when we begin a project from scratch
   with an entirely new team. This would help everyone learn and reach to a
   certain level where there is enough trust
   (in people, pipeline, and test suite) eventually and create the foundation
   for doing TBD
2. In a team that is already setup, the best way to do things is TBD but if a
   new dev walks in, we can enforce PR based reviews for them, and move them to
   TBD as trust builds.
3. In most cases, pairing is enough to get rid of PR reviews. The reason one needs
   PR reviews is when you want a second pair of eyes looking at the code to get
   hold of issues that might have missed the author's attention. An attentive pair,
   reduces that feedback time.
4. PR reviews in the long run, slow you down and leaves the onus of quality on humans
   instead of the standards of quality being codified as test suites and linting rules.
   Let's face it, humans will always tend to make mistakes.

