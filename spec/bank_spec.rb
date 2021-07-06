# frozen_string_literal: true

require 'bank'

describe Bank do
  subject { Bank.new([Account.new(1), Account.new(2), Account.new]) }
  it 'stores account objects in a hash for access by key' do
    expect(subject.accounts).to be_instance_of Hash
    expect(subject.accounts[1]).to be_instance_of Account
    expect(subject.accounts.key?(2)).to be true
  end
  context 'With no prior transactions on account' do
    describe '#print_statement' do
      subject { Bank.new([Account.new(1)]) }
      it 'output has header only' do
        expect { subject.print_statement(1) }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end

  context 'With one prior deposit to account' do
    describe '#print_statement' do
      it 'output shows the deposit logged under header' do
        account = Account.new(1)
        account.credit('10/01/2012', 1000.00)
        bank = Bank.new([account])
        expect { bank.print_statement(1) }.to output(
          "date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n"
        ).to_stdout
      end
    end
  end
end