class Oystercard

  DEFAULT_BALANCE = 0
  MIN_BALANCE = 1
  MAX_BALANCE = 90
  
  attr_reader :balance, :card_status, :entry_station
  
  def initialize(balance = DEFAULT_BALANCE) 
    @balance = balance
    @card_status = false
  end 

  def top_up(amount)
    @amount = amount
    fail 'Your card has hit the limit!' if amount + balance > MAX_BALANCE 
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end 

  def touch_in(station)
    raise "INSUFFICIENT FUNDS" if balance < MIN_BALANCE
    @in_journey = true
    @entry_station = station
  end 

  def touch_out
    deduct_fare(MIN_BALANCE)
    @entry_station = nil
  end 

  private

  def deduct_fare(amount)
    @balance -= amount
  end
end

