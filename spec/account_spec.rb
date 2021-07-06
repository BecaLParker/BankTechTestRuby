require 'account.rb'

describe Account do
  describe '#credit' do

    it 'increases balance by amount' do
      expect { subject.credit("01/01/2020", 10.00) }.to change { subject.balance }.from(0).to(10.00)
    end

    it 'updates transaction log' do
      p subject
      expect { subject.credit("01/01/2020", 10.00) }.to change {
                                                          subject.transaction_log
                                                        }.from([]).to(["01/01/2020 || 10.00 || || 10.00"])
    end
  end
end
