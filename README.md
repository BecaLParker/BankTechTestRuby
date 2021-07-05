# BankTechTestRuby
Ruby repo for Makers Week 10 individual tech test

## What does this code do?
Emulates a banking system. Users can interact in IRB to perform the following tasks on an account:
  - make deposits
  - make withdrawals
  - print statement    
For more details and acceptance criteria, see [original specification requirements](https://github.com/makersacademy/course/blob/main/individual_challenges/bank_tech_test.md).

### Edgecases / Additional scenarios  
I encountered edgecases and scenario considerations which were not covered by the original requirements. I have made the following decisions while designing and building this code. In a real teach test, I would seek some expected outputs from the client to guide these decisions. 

Scenario | Intended code behaviour
---------|------------------------
Withdrawal amount is greater than current balance | Allow account to become overdrawn (i.e. balance can be negative)
Another scenario... | Design decision

## Setup
1. Clone this repo by typing/copying this code snippet into your terminal:   
`git clone https://github.com/BecaLParker/BankTechTestRuby.git`

2. Navigate to relevant directory: 
 `cd BankTechTestRuby`
 
3. Install dependencies from gemfile:
`bundle`

### How to run my tests
Run RSPEC  
`rspec`
=> [example output]

### How to interact as a user
First load the code to IRB  
`code to type in terminal`  
=> [example output]

- To make a deposit:  
`code to type in terminal`  
=> [example output]

- To make a withdrawal:  
`code to type in terminal`  
=> [example output]

- To print account statement:  
`code to type in terminal`  
=> [example output]




## Aims
This task is about producing the best code you I can when there is a minimal time pressure.
 - practice my OO design and TDD skills.
 - working independently 
 - practice reflecting on and improving my own work.

## Original Makers Specification:

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Self-assessment

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit
