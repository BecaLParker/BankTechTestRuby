# frozen_string_literal: true

require 'account'

describe Account do
  describe '#credit' do
    it 'increases balance by amount' do
      expect { subject.credit('01/01/2020', 10.00) }.to change { subject.balance }.from(0).to(10.00)
    end

    it 'updates transaction log' do
      expect { subject.credit('01/01/2020', 10.00) }.to change {
                                                          subject.transaction_log
                                                        }.from([]).to(['01/01/2020 || 10.00 || || 10.00'])
    end
  end

  describe '#debit' do
    it 'decreases balance by amount' do
      subject.credit('01/01/2020', 30.00)
      expect { subject.debit('02/01/2020', 10.00) }.to change { subject.balance }.from(30.00).to(20.00)
    end

    it 'allows negative balance' do
      expect { subject.debit('02/01/2020', 10.00) }.to change { subject.balance }.from(0).to(-10.00)
    end

    it 'updates transaction log' do
      expect { subject.debit('01/01/2020', 10.00) }.to change {
                                                         subject.transaction_log
                                                       }.from([]).to(['01/01/2020 || || 10.00 || -10.00'])
    end
  end

  describe '#statement' do
    it 'returns the transaction log' do
      expect(subject.statement).to eq([])
    end

    it 'returns one credit logged correctly' do
      subject.credit('02/02/2020', 20.00)
      expect(subject.statement).to eq(['02/02/2020 || 20.00 || || 20.00'])
    end

    it 'returns multiple credits logged correctly' do
      subject.credit('02/02/2020', 20.00)
      subject.credit('03/03/2020', 30.00)
      expect(subject.statement).to eq(['02/02/2020 || 20.00 || || 20.00', '03/03/2020 || 30.00 || || 50.00'])
    end
  end
end
