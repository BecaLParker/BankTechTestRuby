# frozen_string_literal: true

# Responsible for user-account interaction logic
class Bank
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement(account_id)
    puts header
    puts get_account(account_id).statement.reverse
  end

  def deposit(date, amount)
    @transactions << [date, amount]
  end

  def withdraw(date, amount)
    @transactions << [date, -amount]
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def get_account(account_id)
    @accounts[account_id]
  end
end
