# frozen_string_literal: true

require 'bank'

describe Bank do
  it 'starts with no transactions' do
    expect(subject.transactions).to be_instance_of Array
    expect(subject.transactions.empty?).to be true
  end

  describe '#deposit' do
    it 'throws error when amount is <= 0' do
      expect { subject.deposit('04/04/2000', 0) }.to raise_error('Transaction must be greater than 0')
    end
    it 'stores a credit transaction' do
      expect { subject.deposit('01/04/2020', 10.00) }.to change {
                                                           subject.transactions
                                                         }.from([]).to([['01/04/2020', 10.00]])
    end
  end

  describe '#withdraw' do
    it 'throws error when amount is <= 0' do
      expect { subject.withdraw('04/04/2000', 0) }.to raise_error('Transaction must be greater than 0')
    end
    it 'stores a debit transaction' do
      expect { subject.withdraw('02/04/2020', 20.00) }.to change {
                                                            subject.transactions
                                                          }.from([]).to([['02/04/2020', -20.00]])
    end
  end

  describe '#print_statement' do
    it 'passes transaction history to printer' do
      printer = instance_double('Printer')

      expect(printer).to receive(:print).with([])

      bank = Bank.new(printer)
      bank.print_statement

      bank.deposit('01/04/2020', 10.00)
      expect(printer).to receive(:print).with([['01/04/2020', 10.00]])
      bank.print_statement
    end
  end
end
