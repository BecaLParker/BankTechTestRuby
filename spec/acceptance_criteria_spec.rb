# frozen_string_literal: true

require 'bank'

describe Bank do
  it 'meets the acceptance criteria described in original requirements' do
    subject.deposit(1, '10/01/2012', 1000.00)
    subject.deposit(1, '13/01/2012', 2000.00)
    subject.withdraw(1, '14/01/2012', 500.00)
    expect { subject.print_statement(1) }.to output(
      "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
    ).to_stdout
  end
end
