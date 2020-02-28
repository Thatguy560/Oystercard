# frozen_string_literal: true

class Station
  # creating station
  attr_reader :name, :zone
  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
