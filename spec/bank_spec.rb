# frozen_string_literal: true

require 'bank'

describe Bank do
  it 'starts with no transactions' do
    expect(subject.transactions).to be_instance_of Array
    expect(subject.transactions.empty?).to be true
  end

  describe '#deposit' do
    subject { Bank.new([Account.new(3), Account.new, Account.new(4)]) }
    it 'calls specified account to credit the amount' do
      expect { subject.deposit(4, '01/04/2020', 10.00) }.to change { subject.accounts[4].balance }.from(0).to(10.00)
      expect { subject.deposit(4, '01/04/2020', 10.00) }.not_to change { subject.accounts[3].balance }
    end

    it 'fails when account is not present' do
      expect { subject.deposit(0, '01/04/2020', 10.00) }.to raise_error('Account not found')
    end
  end

  describe '#withdraw' do
    subject { Bank.new([Account.new(5), Account.new, Account.new(6)]) }
    it 'calls specified account to debit the amount' do
      expect { subject.withdraw(6, '01/04/2020', 10.00) }.to change { subject.accounts[6].balance }.from(0).to(-10.00)
      expect { subject.withdraw(6, '01/04/2020', 10.00) }.not_to change { subject.accounts[5].balance }
    end

    it 'fails when account is not present' do
      expect { subject.withdraw(0, '01/04/2020', 10.00) }.to raise_error('Account not found')
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
        bank = Bank.new([account])
        bank.deposit(1, '10/01/2012', 1000.00)
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
        bank = Bank.new([account])
        bank.deposit(1, '10/01/2012', 1000.00)
        bank.deposit(1, '13/01/2012', 2000.00)
        expect { bank.print_statement(1) }.to output(
          "date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
        ).to_stdout
      end
    end
  end

  context 'With one prior withdrawal from account' do
    describe '#print_statement' do
      it 'output shows the withdrawal logged under header' do
        account = Account.new(1)
        bank = Bank.new([account])
        bank.withdraw(1, '10/01/2012', 1000.00)
        expect { bank.print_statement(1) }.to output(
          "date || credit || debit || balance\n10/01/2012 || || 1000.00 || -1000.00\n"
        ).to_stdout
      end
    end
  end

  context 'With multiple prior withdrawals from account' do
    describe '#print_statement' do
      it 'output shows the withdrawals logged correctly under header' do
        account = Account.new(1)
        bank = Bank.new([account])
        bank.withdraw(1, '10/01/2012', 1000.00)
        bank.withdraw(1, '12/01/2012', 1.00)
        expect { bank.print_statement(1) }.to output(
          "date || credit || debit || balance\n12/01/2012 || || 1.00 || -1001.00\n10/01/2012 || || 1000.00 || -1000.00\n"
        ).to_stdout
      end
    end
  end
end
