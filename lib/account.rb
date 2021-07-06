# Responsible for account attributes

class Account
  attr_reader :balance, :transaction_log, :account_id

  def initialize(balance = 0, transaction_log = [])
    @account_id = rand(1000..9999)
    @balance = balance
    @transaction_log = transaction_log
  end

  def credit(transaction_date, amount)
    @balance += amount
    @transaction_log.push("#{transaction_date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}")
  end

  def statement
    @transaction_log
  end

 
end
