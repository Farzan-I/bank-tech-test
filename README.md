# Bank Tech Test

```
──────────────────██████────────────────
─────────────────████████─█─────────────
─────────────██████████████─────────────
─────────────█████████████──────────────
──────────────███████████───────────────
───────────────██████████───────────────
────────────────████████────────────────
────────────────▐██████─────────────────
────────────────▐██████─────────────────
──────────────── ▌─────▌────────────────
────────────────███─█████───────────────
────────────████████████████────────────
──────────████████████████████──────────
────────████████████─────███████────────
──────███████████─────────███████───────
─────████████████───██─███████████──────
────██████████████──────────████████────
───████████████████─────█───█████████───
──█████████████████████─██───█████████──
──█████████████████████──██──██████████─
─███████████████████████─██───██████████
████████████████████████──────██████████
███████████████████──────────███████████
─██████████████████───────██████████████
─███████████████████████──█████████████─
──█████████████████████████████████████─
───██████████████████████████████████───
───────██████████████████████████████───
───────██████████████████████████───────
─────────────███████████████────────────

```

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

* Navigate to bank account directory
* Follow the installation steps
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
#<Bank:0x00007fa40a8c2728
... 
3.0.2 :003 > account1.deposit(150, '9/09/2009')
 => ["9/09/2009 || 150.00 || || 150.00"] 
3.0.2 :004 > account1.withdraw(25, '10/09/2009')
 => ["9/09/2009 || 150.00 || || 150.00", "10/09/2009 || || 25.00 || 125.00"] 
3.0.2 :005 > account1.statement
9/09/2009 || 150.00 || || 150.00
10/09/2009 || || 25.00 || 125.00
date   || credit || debit || balance
 => 
["date   || credit || debit || balance",
 "10/09/2009 || || 25.00 || 125.00",
 "9/09/2009 || 150.00 || || 150.00"] 
```

## Edge Case
Cannot withdraw an amount that is greater than the balance - unfortunately this bank does not provide planned or unplanned overdrafts.

### Criteria Form
Once completed the challenge and happy with the solution, here's the form to help reflect on the quality of the code: [form](https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit)

