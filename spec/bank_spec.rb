require 'bank.rb'

describe Bank do
  context "When no prior transactions on account" do
    describe '#print_statement' do
      it 'output has header only' do
        expect { subject.print_statement(1) }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end
end
