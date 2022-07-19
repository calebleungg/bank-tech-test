# Coding Exercise Submission

A simple bank application that supports withdrawals, deposits, and balances.

## Installation

1. Install ruby version `3.1.2` ([A guide on how](https://www.ruby-lang.org/en/documentation/installation/))
2. Install dependencies by first installing bundler, then installing the packages. (There is only one dependency, `rspec`)
```bash
$: gem install bundler

# ... and then

$: bundle install
```

## How To Run
All tests reside inside the `spec` folder.

`rspec` was used as the testing framework.

The example scenario test case is inside `spec/examples/alice_spec.rb`

To run the tests, use either commands:
```bash
# runs tests at the specified location
$: rspec spec/examples/alice_spec.rb

# runs all the tests underneath the spec folder
$: rspec
```

## Retrospective

### Balance State - Static vs Derived

Two paths I thought could be taken with storing the balance values.

If we assumed an app required persistence, a benefit of having a static field on a table model is immediate accessibility and the performance issues it avoids. The downsides would be the manual requirement of updating the balance where necessary, and issues around maintainability / inaccuracies from denormalization.

For the exercise, this requirement did not exist, so a simple instance variable on a class seemed adequate. In a real-world application, to me I believe it worthwhile to endeavour a way to have the balance derived. A static value doesn't feel right.

Not immediately sure how practical that would be for say a bank-wide total balance. For user accounts, a lifetime of user transactions doesn't seem insanely large. Perhaps you could derive a user's quartely transactions, accumulate to yearly, to lifetime and so on...
<br>
<br>

### Modules - Balanceable
The `User` and `Bank` class ended up having some shared code domain around balanace updates. The aim of `Balanceable` was to abstract this into it's own shareable module.

Ruby has a nice way of doing this with `modules` and `concerns`. The ability to unit test these modules is a positive.

The module itself is compact and only deals with what it needs to- updating a balance.

I chose to not globaly expose the `balance` instance variable with an `attr_accessor`. Having explicit update methods indicates a need for developers to decide where and when to interact with balances.
<br>
<br>

### Transaction Siblings

A transaction model seemed a necessary abstraction for maintainability. I then thought it useful to separate out logic required for a `Deposit` vs a `Withdrawal` through inheritance.

From the requirements, there is a difference between the two around validating balances. 

Both classes provide an explicit place for code to live, depending on what type of transaction it may be.
<br>
<br>

### One cannot happen without the other

There could have been a broader piece done around updating balances for both the `User` and the `Bank` in a failsale transaction, where if one failed, the other would abort.

Again this results from the decision around storing static balance values in the class.

An example of how I've tried to address this can be seen inside the `Withdrawal` class, in where it validates all aspects needed for a successful transaction, before performing the transaction steps.

If we assume an app has persistence, then we can check model validness for our intended post-transaction state, before persisting the changes. This would be much more air-tight vs validations thought up by a developer that is bound to miss the edgest of edge cases.
<br>
<br>
