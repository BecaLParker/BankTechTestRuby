# frozen_string_literal: true

require 'printer'

describe Printer do
  context 'With no prior transactions' do
    describe '#print' do
      it 'output has header only' do
        expect { subject.print([]) }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end

  # context 'With one prior deposit to account' do
  #   describe '#print_statement' do
  #     it 'output shows the deposit logged under header' do
  #       account = Account.new(1)
  #       bank = Bank.new([account])
  #       bank.deposit(1, '10/01/2012', 1000.00)
  #       expect { bank.print_statement(1) }.to output(
  #         "date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n"
  #       ).to_stdout
  #     end
  #   end
  # end

  # context 'With multiple prior deposits to account' do
  #   describe '#print_statement' do
  #     it 'output shows the deposits logged correctly under header' do
  #       account = Account.new(1)
  #       bank = Bank.new([account])
  #       bank.deposit(1, '10/01/2012', 1000.00)
  #       bank.deposit(1, '13/01/2012', 2000.00)
  #       expect { bank.print_statement(1) }.to output(
  #         "date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
  #       ).to_stdout
  #     end
  #   end
  # end

  # context 'With one prior withdrawal from account' do
  #   describe '#print_statement' do
  #     it 'output shows the withdrawal logged under header' do
  #       account = Account.new(1)
  #       bank = Bank.new([account])
  #       bank.withdraw(1, '10/01/2012', 1000.00)
  #       expect { bank.print_statement(1) }.to output(
  #         "date || credit || debit || balance\n10/01/2012 || || 1000.00 || -1000.00\n"
  #       ).to_stdout
  #     end
  #   end
  # end

  # context 'With multiple prior withdrawals from account' do
  #   describe '#print_statement' do
  #     it 'output shows the withdrawals logged correctly under header' do
  #       account = Account.new(1)
  #       bank = Bank.new([account])
  #       bank.withdraw(1, '10/01/2012', 1000.00)
  #       bank.withdraw(1, '12/01/2012', 1.00)
  #       expect { bank.print_statement(1) }.to output(
  #         "date || credit || debit || balance\n12/01/2012 || || 1.00 || -1001.00\n10/01/2012 || || 1000.00 || -1000.00\n"
  #       ).to_stdout
  #     end
  #   end
  # end
end
