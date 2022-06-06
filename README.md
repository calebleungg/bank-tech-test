# Afterpay Coding Exercise Submission

Here is my submission. It was an enjoyable exercise to do. Looking forward to hearing back!

# Installation

The submission has been done with Ruby versions `3.1.2`.
1. Install ruby version `3.1.2` ([A guide on how](https://www.ruby-lang.org/en/documentation/installation/))
2. Install dependencies by first installing bundler, then installing the packages. (There is only one dependency, `rspec`)
```bash
$: gem install bundler

# ... and then

$: bundle install
```

# How To Run
The tests reside inside the `spec` folder. I have chosen to use `rspec` as my testing framework. You will find the test case for the example test scenario inside `spec/examples/alice_spec.rb`


To run the tests, use the commands
```bash
# runs tests at the specified location
$: rspec spec/examples/alice_spec.rb

# runs all the tests underneath the spec folder
$: rspec
```

# Retrospective

## Balance State - Static vs Derived

Two paths I thought could be taken with storing the balance values.

Assuming the app would translate into one that required persistence, a benefit of having a field on a table model is accessibility. The downsides would be ensuring EVERYWHERE related to balance changes was done so correctly with a fine-tooth comb.

For the exercise, there were no persistence requirements, so a simple instance variable on a class was what I thought most appropriate. In a real-world application, to me it seems worthwhile to endeavour a way to have the balance derived. A static value also doesn't feel right.

Not immediately sure how practical that would be for say a bank-wide total balance. For user accounts, a lifetime of user transactions doesn't seem insanely large. Perhaps you could derive a user's quartely transactions, accumulate to yearly, to lifetime and so on...
<br>
<br>

## Modules - Balanceable
The aim was to encapsulate code around balance updates the `User` and `Bank` ended up having in common.

Ruby has a nice way of doing this with `modules` and `concerns`. The ability to unit test these modules is a positive. 

The module itself is compact and only deals with what it needs to- updating a balance.

It also did not make sense to me, to globaly expose the `balance` instance variable with an `attr_accessor`. It just seemed a tad barbaric and unsafe. Having explicit update methods injected with the module indicates a need for developer decision, on where and when to use.
<br>
<br>

## Transaction Siblings

A transaction model seemed a necessary abstraction that would benefit down the road. I then thought it useful to separate out logic required for a `Deposit` vs a `Withdrawal` through inheritance.

From the requirements, there is a distinct difference between the two around validating balances. The two classes provide a way for us to deal with this. Looking at the files, it is clear that `Deposits` have no required validations, whereas a `Withdrawal` has some extra steps before execution should take place.
<br>
<br>
