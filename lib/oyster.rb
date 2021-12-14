class Oystercard
  MAX_BALANCE = 90
  attr_reader :balance
 
  def initialize(balance = MAX_BALANCE)
    @balance = 0
  end 

  def top_up(amount)
    fail 'Your card has hit the limit!' if amount + balance > MAX_BALANCE 
    @balance += amount
  end

  def deduct_fare(amount)
    @balance -= amount
  end

end