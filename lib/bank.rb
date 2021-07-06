# frozen_string_literal: true

require_relative 'account'
require_relative 'calendar'

# Responsible for user-account interaction logic
class Bank
  attr_reader :accounts

  def initialize(accounts)
    @accounts = Hash[accounts.map { |account| [account.account_id, account] }]
  end

  def print_statement(account_id)
    puts header
    puts get_account(account_id).statement
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def get_account(account_id)
    @accounts[account_id]
  end
end
