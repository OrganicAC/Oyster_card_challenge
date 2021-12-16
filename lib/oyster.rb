require 'station'
require 'journey'

class Oystercard

  DEFAULT_BALANCE = 0
  MIN_BALANCE = 1
  MAX_BALANCE = 90
  
  attr_reader :balance
  
  def initialize(balance = DEFAULT_BALANCE) 
    @balance = balance
  end 

  def top_up(amount)
    @amount = amount
    fail 'Your card has hit the limit!' if amount + balance > MAX_BALANCE 
    @balance += amount
  end

  def touch_in(station)
    raise "INSUFFICIENT FUNDS" if balance < MIN_BALANCE
    #@in_journey = true
    #@entry_station = station
    #@journey_history.store(:entry_station, station)
  end 

  def touch_out(station)
    deduct_fare(MIN_BALANCE)
    #@entry_station = nil
    #@exit_station = station
    #@journey_history.store(:exit_station, station)
  end 

  private

  def deduct_fare(amount)
    @balance -= amount
  end
end

