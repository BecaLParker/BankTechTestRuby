
alias user="USER"
alias bank="class Bank

  - attributes: 
    * transactions
    * printer
    
  - responsible for: 
    * user-account interaction logic"
alias prt="class Printer
  - responsible for: 
  * printing statement in required format"

user->bank:"Deposit this amount"
bank->bank:"Logs transaction"

user->bank:"Withdraw this amount"
bank->bank:"Logs transaction"

user->bank:"Print my statement"
bank->prt:"Transactions data"
prt->user:"Returns statement"

