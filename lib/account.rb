# frozen_string_literal: true

# Responsible for account attributes

class Account
  attr_reader :balance, :transaction_log, :account_id

  def initialize(account_id = rand(1000..9999), balance = 0, transaction_log = [])
    @account_id = account_id
    @balance = balance
    @transaction_log = transaction_log
  end

  def credit(transaction_date, amount)
    @balance += amount
    @transaction_log.push("#{transaction_date} || #{format('%.2f', amount)} || || #{format('%.2f', @balance)}")
  end

  def debit(transaction_date, amount)
    @balance -= amount
    @transaction_log.push("#{transaction_date} || || #{format('%.2f', amount)} || #{format('%.2f', @balance)}")
  end

  def statement
    @transaction_log
  end
end
