# frozen_string_literal: true

require 'bank'

describe Bank do
  it 'meets the acceptance criteria described in original requirements' do
  account = Account.new(1)
  bank = Bank.new([account])
  bank.deposit(1, "10/01/2012", 1000.00)
  bank.deposit(1, "13/01/2012", 2000.00)
  bank.withdraw(1, "14/01/2012", 500.00)
  expect { bank.print_statement(1) }.to output(
    "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
  ).to_stdout
  end
end
