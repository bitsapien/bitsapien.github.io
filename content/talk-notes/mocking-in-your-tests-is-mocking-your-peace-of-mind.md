---
title: "Mocking in Tests : How does it feel ?"
date: 2020-06-14T08:24:04+05:30
draft: true
---

Slides
* Mocking in Tests
  How to divide concerns between unit tests and integration 
* TDD and mocking are like best friends
  * Mocking come as a natural to TDD
  * The way we do TDD influences the way we think about mocking
  * Mocking happens extensively, which is both a good and a bad thing.
* How does write unit tests?
  * One of the approaches - Arrange Act and Assert
  * You have a feature to create.
  * You start arranging your objects - your mocks, and identifying the subject
    under test 
  * x = a + b + c
    * Prepare a,b,c 
    * then you act on it 
    * assert on behaviour or state 
* Image
  ![]()
  * SUT is Orders, Collaborator is Warehouse
  * style of test is that it does state verification
  * asserting on the side effect as well
  * 
* ![]()
  Using mocks for the above, we are testing implementation or behaviour/ open box testing
  explain code, especially around implementation, you are testing the "how"
* ![]()
  Using stubs, we are testing state, closed box testing
  like a test double, omits the part that actually sends the email.
* ![]()
  now with a mock and then you again show how behaviour is being tested
  --Do we all understand state and behaviour verification---
* What are these different kind of mocks we here?
  You saw examples, the word "mock" is overloaded
    You saw examples, the word "mock" is overloaded.
  * **Dummy objects** are passed around but never actually used. Usually they are
  just used to fill parameter lists. _need an example here_
  * **Fake objects** actually have working implementations, but usually take
  some shortcut which makes them not suitable for production (an in memory
  database is a good example). _refer to mailer object thingy_
  * **Stubs** provide canned answers to calls made during the test, usually not
    responding at all to anything outside what's programmed in for the test.
    _refer to mailer object again_
  * **Spies** are stubs that also record some information based on how they were
    called. One form of this might be an email service that records how many
    messages it was sent. _mailer object again_
* Classicist or Mockist way of testing
  Different styles of testing
  what do you eman by the terms ? Take a cuew form the prev examples
  
  _examples needed_
  
  Keep it quick, and just give my opinion
  Test setup phase 
  
  C - need to make colloborators for all, fixtures are used
  
  M - only need to create the SUT and mocks for its immediate neighbors. 

  Both sides say this is too much  work. C - as much code as my real implementation

  Test isolation
  
  C - bug in colloborator will fail a cascade of other tests, difficult to locate
  
  M - bug in colloborator would only make when it is SUT fail.

  Need for tests and granularity changes in both approaches. 
  Clusters of test would test everything ©
  Yiou need more tests (M)

  Coupling : How does it impact code?
  (M) - Testing implementation leads to problems in refactoring, they make you think about the implementation of the system.
  Mock tools spoil the situation with things like “Any” 

  Testing
  But both fail

* How your testing style impacts design?
  
  Greater coupling, you test behaviour, refactoring becomes a pain, chances of
  false positives(show diagram for this)

* Example: Trust on an Outside World Interface
  interacting with a 3rd party library, very common

* ![]()
  Explain code
* ![]()
  introduce moto library
  shortcut approach
  external dep mocking, dont use mocking frameworks or libraries
  should happen in integration testing
  inmemory DB in integration test (H2)
   Incidental problems: storage qoutas, permissions missing, a problem with the side effect that you are causing would never show up because moto has mocked that.
* Example: Coupling
  ![]()
  explain code
  ![]()
  explain jest mocking
  talk about side effect
  * What causes tight coupling?
    Tight coupling has many causes:
    * Mutation vs immutability
    * Side-Effects vs purity/isolated side-effects
    * Responsibility overload vs Do One Thing (DOT)
    * Procedural instructions vs describing structure
    * Class Inheritance vs composition
  ![]()
  ![]()
    Avoid that false positive and make it fail in the integration test
  * Using composition 
    bigger problem to smaller pieces
    decomposition strategy has failed.
    _no connect to prev eg_
    _give example_
  * Reduce coupling
      * Tight coupling:
        * Class inheritance (coupling is multiplied by each layer of inheritance and eaach descendant class)
        * Global variables
        * Other mutable global state (browser DOM, shared storage, network, etc…)
        * Module imports with side-effects
        * Implicit dependencies from compositions, e.g., const enhancedWidgetFactory = compose(eventEmitter, widgetFactory, enhancements); where widgetFactory depends on eventEmitter
        * Dependency injection containers _understand how DI can be bad to coupling_
        * Dependency injection parameters
        * Control parameters (an outside unit is controlling the subject unit by telling it what to do)
        * Mutable parameters
* Example: Testing an express app
  code coverage - 100% cobvergae might not mean you can rely completely on it,
  but there is a way to  be able to sleep well at night
  what should be tested?
  * ![]()
    How do you unit test this file ?
    100% code coverage?
    100% integration test is important here 
  * ![]()
* Principles to use when mocking
  If there is no logic in your code (just pipes and pure compositions), 0% unit test coverage might be acceptable, assuming your integration or functional test coverage is close to 100%. However, if there is logic (conditional expressions, assignments to variables, explicit function calls to units, etc…), you probably do need unit test coverage, and there may be opportunities to simplify your code and reduce mocking requirements.


  * Reduce mocking in unit tests and test doubles 
  * Use test versions of external systems in integration tests. (in memory dbs, h2). 
  * Push side effects to the boundaries of your system so you dont have to unit test them. (make functions/classes pure)
  * Dont take coverage as the holy grail.
  * Reduce coupling
  * Use pub/sub models to communicate
* Fight your urge to mock in unit tests
* Use test versions of external systems in integration tests. 
* Push side effects to the boundaries of your system
* Dont take coverage as the holy grail.
* Reduce coupling, reduce your need to use mocks
* Mocks ain't evil, mocks are too much power, and thus use it responsibly.
Seperate use from construction - talk to Sarat
locked the versions
interface mocking 
* Library upgrades would make it fail.
hexagonal architecture ?
tests are slower, right? what you meant was I want faster feedback if something
broke
- we miss the focus on why we write tests in the first place, balance speed and
  ease with being able to sleep at night
- tradeoff, breaking in prod vs slower tests
lot of failing tests
* coupling
probably OO approach 









Shows that test subject is actually coupled with your code, it is an indication of coupling. Removing the need to mock would simplify tests and the code.
* Code is rapidly changing, cant do white box testing, refactoring becomes problematic
* Dont test the "how" in the unit, test the "what"

Mocking in unit as well as integration tests?
What is your unit ?



Why do we write tests?
* 
When do you need a mock ?
* You have written code that does side-effects (changes system outside it's
  control)
* Each case will explain what kind of mock you would need
  * Explain the problem 
  * Show a solution with the specific kind of mock 
  * Show an alternative without the need to mock.
  * Case 1: Interface verification
    * Problem: You are writing a script that talks to AWS services in python, you use boto3 inside your code. The actual library's contract changed but the mocking library's contract did not.
    ```python
    import boto3

    class AarogyaSetu(object):
        def __init__(self, name, value):
            self.name = name
            self.adhaar_number = adhaar_number

        def save(self, bucket_name):
            s3 = boto3.client('s3', region_name='us-east-1')
            s3.put_object(Bucket='mybucket', Key=self.name, Body=self.adhaar_number)

    ```

    ```python
    import boto3
    from moto import mock_s3
    from mymodule import MyModel


    @mock_s3
    def test_aarogya_setu_save():
        conn = boto3.resource('s3', region_name='us-east-1')
        # We need to create the bucket since this is all in Moto's 'virtual' AWS account
        conn.create_bucket(Bucket='mybucket')

        model_instance = AarogyaSetu('fsociety', 'xxxx-xxxxx-xxxxx-xxxx')
        model_instance.save()

        body = conn.Object('mybucket', 'fsociety').get()['Body'].read().decode("utf-8")

        assert body == 'xxxx-xxxxx-xxxxx-xxxx'
    ```
    Incidental problems: storage qoutas, permissions missing, a problem with the side effect that you are causing would never show up because moto has mocked that.
    * Case 2:
      * Problem: Your logic is intertiwined with side effects.
    ```js

    // users.js
    import axios from 'axios';

    class Users {
      static all() {
        return axios.get('/users.json').then(resp => {
          return resp.data.filter((user) => user.isActive)
         });
      }
    }

    export default Users;
    ```
    How would you write a test for this?
    ```js
    // users.test.js
    import axios from 'axios';
    import Users from './users';

    jest.mock('axios');

    test('should fetch active users', () => {
      const users = [{name: 'Bob', isActive: true}, {name: 'Alice', isActive: false}];
      const resp = {data: users};
      axios.get.mockResolvedValue(resp);

      // or you could use the following depending on your use case:
      // axios.get.mockImplementation(() => Promise.resolve(resp))

      return Users.all().then(data => expect(data).toEqual([{name: 'Bob', isActive: true }]));
    });
    ```
    Dont test the library in unit testing
    Without mocking
    ```js
       // users.js
    import axios from 'axios';

    class Users {
      static all() {
        return axios.get('/users.json').then(resp => {
          return resp.data
         });
      }
      static filterActive(users) {
        return users.filter((user) => user.isActive)
      }
    } 
    ```
    Test
    ```js
       // users.test.js
    import axios from 'axios';
    import Users from './users';

    test('should filter active users', () => {
      // Given
      const users = [{name: 'Bob', isActive: true}, {name: 'Alice', isActive: false}];
      // When
      const activeUsers = Users.filterActive(users)
      // Then
      expect(activeUsers).toEqual([{name: 'Bob', isActive: true}])
    ```
    Move the side effect test to integration test

* Spies encourage white box testing
  Kent Beck's central point in his book is that TDD mitigates fear, allows refactoring, and gives you immediate feedback. 
  Should you test the means or the end itself ?? What is more useful ?
  Dont test the "how" in the unit, test the "what"
  Was a method called 2/n times 
  mocks and spies are not required 
  # flat callstack

  ```ruby
  def step1
    # bleh
    # step2()
  end

  def step2
    # bleh
    # step3()
  end

  def step3
    # bleh
  end

  def main
    step1()
    step2()
    step3()
  end

  step3(step2(step1()))

  main()

  step1()
  ```

  * Dependency injection


```java
  public void CreateAandB(bool arg1, bool arg2) {
    if(arg1)
        daoA.Create();
    else throw new exception;
    if(arg2)
        daoB.Create();
    else throw new exception;
}
```

```java

IDao daoA = MockRepository.GenerateMock<IDao>(); //create mock
daoA.Expect(dao=>dao.Create); //set expectation

...

daoA.VerifyExpectations(); //check that the Create method was called
```





---

https://www.martinfowler.com/articles/mocksArentStubs.html

* What do you want to test?
    * Implementation or behaviour or state ?
    * Behaviour state in case of cache 

Scenarios:
* Side effecting object mocked
* Stop real mail from being sent object 

What is a mock ?
- Test double 
    - Dummy : used to fill parameter lists - this can be a code smell
    - Fake: working implementations but takes shortcuts and not used by prod  like moto3 
    - Stubs: provides canned answers to calls made
    - Spies: record info on how they were called 
    - Mocks: pre programmed objects with expectations which form a spec for the call.
        - Behaviour verification 
        - 



We mock out state which could be the problem.
Push your side effects to the boundaries 

localstack


* One mock talking to another
* Unneeded complexity
* Don’t believe in the fact - “write less tests because they run slow”
* One time effort to setup real things 
* 

https://stackoverflow.com/questions/1595166/why-is-it-so-bad-to-mock-classes
https://www.thoughtworks.com/insights/blog/mockists-are-dead-long-live-classicists

The “Can you sleep at night?” test

Why is mocking/stubbing dangerous?

But, what happens if your test is too white box and knows so much about how things are implemented that if you refactor something, your test fails and you have to refactor your test? It entirely defeats the purpose of having a test to make sure that you didn’t break anything with your changes.

Point out false positives wala problem 

https://dev.to/asizikov/you-are-mocking-it-wrong-5gh3

To give it a nice catchy start, I'd claim here, that mocks should be used when you have to, but not when you can. 

https://news.ycombinator.com/item?id=7809402
Kent Beck's central point in his book is that TDD mitigates fear, allows refactoring, and gives you immediate feedback. 

Extensive mocking makes developers fearful to refactor (thus hurting design) and reduces the quality of feedback. Not to mention it makes your tests hard to refactor too.

https://blog.cleancoder.com/uncle-bob/2014/05/10/WhenToMock.html


Mock across architecturally significant boundaries, but not within those boundaries.
Write your own mocks.



Microservice why do you use ORMs ? There is just so many SQLs you write.

