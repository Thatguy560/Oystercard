class Oystercard
  attr_reader :balance, :in_use, :entry_station
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 3
  def initialize(balance = 0)
    @balance = balance 
    @entry_station
    # @in_use = false
  end

  def top_up(amount)
    fail "Balance cannot exceed #{MAXIMUM_BALANCE}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station
  end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
    # @in_use = true
  end

  def touch_out
    @entry_station = nil
    deduct(MINIMUM_CHARGE)
    # @in_use = false
  end
end

private

def deduct(amount)
  @balance -= amount
end
