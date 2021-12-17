require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:station) { double :station }

  describe 'begin and end journey' do

    it 'remembers the station on touch in' do
      subject.begin_journey(station)
      expect(subject.entry_station).to eq station
    end 

    it 'tests for an exit station' do
      subject.begin_journey(station)
      subject.end_journey(station)
      expect(subject.exit_station).to eq station
    end 
  end 
    
  describe 'Journey list' do
    it 'is an empty hash for journey' do
      expect(subject.journey_history).to eq ({}) #be_empty
    end 

    it 'tests for beginning and out creating one journey' do
      subject.begin_journey(station)
      subject.end_journey(station)
      expect(subject.journey_history).to include ({
        entry_station: station,
        exit_station: station
      })
    end
  end 

  describe 'in_journey' do
    it 'is initially not a journey' do
      expect(subject).not_to be_in_journey
    end 
    it 'can begin journey' do
      subject.begin_journey(station)
        expect(subject).to be_in_journey
      end 
  
    it 'can end journey' do
      subject.begin_journey(station)
      subject.end_journey(station)
      expect(subject).not_to be_in_journey
    end 
  end 

  describe 'fare' do
    it 'expects default penalty fare' do
      subject.exit_station
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end 


  context 'given an exit station' do
    let(:new_station) { double :new_station } 
  
    before do
      subject.end_journey(new_station)
    end 

    it 'expects minimum fare' do
      expect(subject.fare).to eq 1
    end 
  end   
end 
end 