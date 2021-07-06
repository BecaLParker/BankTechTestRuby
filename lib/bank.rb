require_relative 'account.rb'
require_relative 'calendar.rb'

# Responsible for user-account interaction logic
class Bank
  def print_statement(account_id)
    puts header
  end

  private

  def header
    "date || credit || debit || balance"
  end
end
