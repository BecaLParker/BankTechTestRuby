
require 'calendar'
require 'timecop'

describe Calendar do
 
  describe '#date' do
    before do
      Timecop.freeze(Time.now)
    end
  
    after do
      Timecop.return
    end
    it 'returns a DD/MM/YYYY format' do
      expect(subject.date).to eq("31/10/2021")
    end
  end
end