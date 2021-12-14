require 'oyster'

describe Oystercard do
  subject(:oystercard) { described_class.new }

    it 'Equals 0' do
      expect(subject.balance).to eq 0
    end

    describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }
    
      it 'can top up balance' do
        expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      end

      it "raises error when trying to top up when card hits limit" do
        max_balance = Oystercard::MAX_BALANCE
        subject.top_up max_balance
        expect{ subject.top_up 1 }.to raise_error 'Your card has hit the limit!'
      end
    end

    describe '#deduct_fare' do
      it { is_expected.to respond_to(:deduct_fare).with(1).argument }
    
      it 'can deduct fare from balance' do
        expect{ subject.deduct_fare 1 }.to change{ subject.balance }.by -1
      end
    end
  
    it 'checks for not yet in journey' do
      expect(subject).not_to be_in_journey  
    end

    it 'touches in' do
      oystercard.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in
      expect(subject).to be_in_journey
    end 

    it 'touches out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end 

    it "raises error if balance < 1"  do
      oystercard.deduct_fare(Oystercard::DEFAULT_BALANCE)
      expect { subject.touch_in }.to raise_error "INSUFFICIENT FUNDS"
    end
end

