class Journey 
  attr_reader :entry_station, :exit_station
  
  PENALTY_FARE = 6
  NORMAL_FARE = 3
  def initialize
    @entry_station = nil
    @exit_station = nil 
  end

  def started_journey(entry_station)
    @entry_station = entry_station
  end

  def finished_journey(exit_station)
    @exit_station = exit_station
  end

  def in_journey? # we use a ? to indicate method returns a boolean value.
    @entry_station != nil && @exit_station == nil
  end 

  def calculate_fare
    # This says if we forgot to tap in or out of a station we're charged the maximum penalty otherwise charge the normal penalty.
    entry_station == nil || exit_station == nil ? PENALTY_FARE : NORMAL_FARE
  end
end