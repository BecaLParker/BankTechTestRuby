# frozen_string_literal: true

require 'bank'

describe Bank do
  subject { Bank.new([Account.new(1), Account.new(2), Account.new]) }
  it 'stores account objects in a hash for access by key' do
    expect(subject.accounts).to be_instance_of Hash
    expect(subject.accounts[1]).to be_instance_of Account
    expect(subject.accounts.key?(2)).to be true
  end

  describe '#deposit' do
    subject { Bank.new([Account.new(3), Account.new, Account.new(4)]) }
    it 'calls specified account to credit the amount' do
      expect { subject.deposit(4, '01/04/2020', 10.00) }.to change { subject.accounts[4].balance }.from(0).to(10.00)
      expect { subject.deposit(4, '01/04/2020', 10.00) }.not_to change { subject.accounts[3].balance }
    end
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

  context 'With multiple prior deposits to account' do
    describe '#print_statement' do
      it 'output shows the deposits logged correctly under header' do
        account = Account.new(1)
        account.credit('10/01/2012', 1000.00)
        account.credit('13/01/2012', 2000.00)
        bank = Bank.new([account])
        expect { bank.print_statement(1) }.to output(
          "date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
        ).to_stdout
      end
    end
  end
end
