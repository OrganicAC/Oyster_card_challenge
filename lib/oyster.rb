class Oystercard
  MAX_BALANCE = 90
  attr_reader :balance, :card_status
 
  def initialize(balance = MAX_BALANCE) 
    @balance = 0
    @card_status = false
  end 

  def top_up(amount)
    fail 'Your card has hit the limit!' if amount + balance > MAX_BALANCE 
    @balance += amount
  end

  def deduct_fare(amount)
    @balance -= amount
  end

  def in_journey?
    @card_status
  end 

  def touch_in
    @card_status = true
  end 

  def touch_out
    @card_status = false
  end 

end

