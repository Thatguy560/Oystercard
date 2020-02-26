require_relative 'journey.rb'
class Oystercard
  attr_reader :balance, :in_use, :entry_station, :journey
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 3
PENALTY_CHARGE = 6
  def initialize(balance = 0)
    @balance = balance 
    @journey = Journey.new
  end

  def top_up(amount)
    fail "Balance cannot exceed #{MAXIMUM_BALANCE}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish_journey(exit_station)
    deduct(MINIMUM_CHARGE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
