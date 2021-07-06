# Responsible for account attributes

class Account
  attr_reader :balance, :transaction_log

  def initialize(balance = 0, transaction_log = [])
    @account_id = "random generator needed?"
    @balance = balance
    @transaction_log = transaction_log
  end

  def credit(transaction_date, amount)
    @balance += amount
    @transaction_log.push("#{transaction_date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}")
  end

 
end
