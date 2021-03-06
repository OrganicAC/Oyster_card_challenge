require 'oyster'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) { double :station }

  it 'has a balance of zero' do
    expect(subject.balance).to eq 0
  end 


  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument  } 
    
    it 'can top up balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end 

    it 'raises an error if the max balance is exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up 1 }.to raise_error 'Your card has hit the limit!'
    end 
  end 

    it 'will not touch in if below min balance' do
      oystercard.touch_out(station)
      expect { oystercard.touch_in(station) }.to raise_error "INSUFFICIENT FUNDS"
    end 

    it 'charges on touch out' do
      oystercard.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(station)
      expect{ subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::MIN_BALANCE)
    end 
  end 