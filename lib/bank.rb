# frozen_string_literal: true

require_relative 'account'
require_relative 'calendar'

# Responsible for user-account interaction logic
class Bank
  attr_reader :accounts

  def initialize(calendar = Calendar.new, accounts)
    @calendar = calendar
    @accounts = Hash[accounts.map { |account| [account.account_id, account] }]
  end

  def print_statement(account_id)
    puts header
    puts get_account(account_id).statement
  end

  def deposit(account_id, amount)
    get_account(account_id).credit(transaction_date, amount)
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def get_account(account_id)
    @accounts[account_id]
  end

  def transaction_date
    @calendar.date
  end
end
