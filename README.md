# Bank Tech Test

```
─────────────█████████████──────────────
──────────────███████████───────────────
───────────────██████████───────────────
────────────────████████────────────────
────────────────▐██████─────────────────
────────────────▐██████─────────────────
──────────────── ▌─────▌────────────────
────────────────█████████───────────────
────────────████████████████────────────
──────────███████████  ███████──────────
────────████████████     ███████────────
──────███████████          ██████───────
─────████████████   ██  ██████████──────
────████████████            ████████────
───██████████████       █   █████████───
──████████████████████  ██   █████████──
──█████████████████████  ██   █████████─
─██████████████████████  ██   ██████████
███████████████████████       ██████████
███████████████████          ███████████
─███████████████████████  ██████████████
─███████████████████████  █████████████─
──█████████████████████████████████████─
───██████████████████████████████████───
───────██████████████████████████████───
───────██████████████████████████───────
─────────────███████████████────────────
```

## Introduction
Given a tech test which aimed to replicate an actual job interview tech test. This gave an opportunity to showcase OO design and TDD skills. Time limit of 48 hours to implement the below acceptance criteria. 

## Specification

### Requirements

* Be able to interact with written code via a REPL like IRB or Node.  (Don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawals
* Account statement (date, amount, balance) printing
* Data can be kept in memory (it doesn't need to be stored to a database or anything)

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Installation and use
* Fork this repo
* Navigate to desired file path in command line
* Clone to your local machine using `git clone <your repo name>`
* Install Rspec using `rspec --init`
* Run the tests for the program using `rspec` in the command line
* See below to use the app on an interactive shell

## Self-assessment

### Ruby IRB command line interface snippet 

#### How to run this program
* Follow the installation steps
* Navigate to bank account directory
* Type into command line/REPL `irb` to be able to run **interactive ruby**
* Type `require './lib/bank_account'` to use the ruby file
* Set up a new bank account and call it anything i.e. `my_first_account = Bank.new`
* Can use deposit and withdrawal functionality using either `.deposit` or `.withdraw` on the chosen account
* Either of these take two arguments, one is the amount and the second is the date (in string format - day/month/year) i.e. `my_first_account.deposit(1000, '10/10/2010')`
* Use `.statement` on your account to get the transactions placed

```
farzan bank % irb
3.0.2 :001 > require './lib/bank_account'
 => true 
3.0.2 :002 > account1 = Bank.new
 => 
#<Bank:0x00007fd7bb1b38d0
... 
3.0.2 :003 > account1.deposit(150, '9/09/2009')
 => ["9/09/2009 || 150.00 || || 150.00"] 
3.0.2 :004 > account1.withdraw(25, '10/09/2009')
 => ["9/09/2009 || 150.00 || || 150.00", "10/09/2009 || || 25.00 || 125.00"] 
3.0.2 :005 > account1.statement
date   || credit || debit || balance
10/09/2009 || || 25.00 || 125.00
9/09/2009 || 150.00 || || 150.00
 => 
["date   || credit || debit || balance",
 "10/09/2009 || || 25.00 || 125.00",
 "9/09/2009 || 150.00 || || 150.00"] 
3.0.2 :006 > quit
```
## My approach
* Started off by planning what I expected my bank class to look like and took into account the functionality of it
* 

## Edge cases
* Cannot withdraw an amount that is greater than their balance - unfortunately this bank does not provide planned or unplanned overdrafts
* A default date of the current time (in day/month/year format) is provided when there is no specified date

## Future integrations
* Have the date become self reliant and not be dependent on the input from a client - having the default value for the date in place helps but I believe there must be a better way to do this
* As this is done in Ruby, there is an implicit return from the method and therefore the statement output is given twice - would try to see if there is a better way to do this
* Ideally I would've liked to have split my bank class into maybe 3 classes (one as the bank, one as the transactions and one as the statements) - this is something I will try to implement on another occassion. This also goes to show I should've planned my approach better and known what I wanted to do before hand

### Criteria form
Once completed the challenge and happy with the solution, here's the form to help reflect on the quality of the code: [form](https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit)
