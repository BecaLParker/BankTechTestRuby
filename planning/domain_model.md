
alias user="User
(knows their 
account_id)"
alias bank="class Bank
  - has attributes: accounts, calendar
  - is responsible for: user-account interaction logic"
alias cal="class Calendar
 - is responsible for: providing the date"
alias acc="class Account
 - attributes: balance, transaction_log, account_id
 - is responsible for: updating and/or returning its own attributes"

user->bank:"Deposit this amount 
into my account"
bank->cal:"What's the date of 
this transaction?"
cal->bank:"Date"
bank->acc:"Hey specified account, 
here's the data to run your
#credit and #update_transaction_log methods"
acc->acc:"increase balance by amount 
and log the transaction"

user->bank:"Withdraw this amount 
from my account"
bank->cal:"What's the date of 
this transaction?"
cal->bank:"Date"
bank->acc:"Hey specified account, 
here's the data to run your
#debit and #update_transaction_log methods"
acc->acc:"decrease balance by amount 
and log the transaction"

user->bank:"Print my statement"
bank->acc:"Hey specified account, 
give me the raw data for a statement please"
acc->bank:"Raw transaction log data"
bank->bank:"Format the data 
according to acceptance criteria"
bank->user:"Returns statement"
