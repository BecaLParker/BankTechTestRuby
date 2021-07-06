# frozen_string_literal: true

require_relative 'account'

# Responsible for user-account interaction logic
class Bank
  attr_reader :accounts

  def initialize(accounts)
    @accounts = Hash[accounts.map { |account| [account.account_id, account] }]
  end

  def print_statement(account_id)
    puts header
    puts get_account(account_id).statement.reverse
  end

  def deposit(account_id, date, amount)
    raise 'Account not found' if @accounts.key?(account_id) == false

    get_account(account_id).credit(date, amount)
  end

  def withdraw(account_id, date, amount)
    raise 'Account not found' if @accounts.key?(account_id) == false

    get_account(account_id).debit(date, amount)
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def get_account(account_id)
    @accounts[account_id]
  end
end
