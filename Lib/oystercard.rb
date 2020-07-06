require_relative 'journey'
require_relative 'station'

class Oystercard
  # This allows instance variables to be read and re-used.
  attr_reader :balance, :current_trip, :journey, :entry_station, :exit_station
  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
# Instance variables don’t have to be created in the initialize method, but that’s how you give them an initial value
  def initialize(balance = DEFAULT_BALANCE) # this initialises every oystercard with balance of 0
    @balance = balance
    @current_trip = nil
    @journeys = []
  end

  def check_balance
    puts "Your current Oystercard balance is £#{'%.2f' % @balance}"
  end

  def top_up(amount)
    raise "Maximum balance of £#{Oystercard::MAXIMUM_BALANCE} reached" if max_balance_reached
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Minimum balance of £#{Oystercard::MINIMUM_BALANCE} needed." if insufficient_funds
    @current_trip != nil ? add_journey && calculate_fare :
    new_journey
    @current_trip.started_journey(entry_station)
  end

  def touch_out(exit_station)
    if @current_trip == nil
    new_journey # Saves new journey even if you don't tap in at entry station.
    end
    @current_trip.finished_journey(exit_station)
    calculate_fare
    add_journey # Saves and records the journey
    @current_trip = nil # Sets entry and exit station to nil (restarts it)
  end

  def journey_history
    @journeys.empty? ? "No journeys have been made yet" : @journeys.each { |journey| puts journey }
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def max_balance_reached
    @balance >= MAXIMUM_BALANCE
  end

  def insufficient_funds
    @balance < MINIMUM_BALANCE
  end

  def add_journey
    @journeys << @current_trip
  end

  def calculate_fare
    deduct(@current_trip.calculate_fare)
  end

  def new_journey
    @current_trip = Journey.new
  end

end

# Once you've made a method private,
# you no longer need to have a test for it
