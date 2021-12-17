class Journey
  attr_reader :journey_history, :entry_station, :exit_station
  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize 
    @journey_history = {}
  end 

  def in_journey?
    entry_station
  end 

  def begin_journey(station)
    @in_journey = true
    @entry_station = station
    @journey_history.store(:entry_station, station)
  end 

  def end_journey(station)
    @entry_station = nil
    @exit_station = station
    @journey_history.store(:exit_station, station)
  end 

  def fare
    return PENALTY_FARE if !exit_station 
    1
  end 
end 