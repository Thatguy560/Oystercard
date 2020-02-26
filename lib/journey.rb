class Journey
    attr_reader :entry_station, :journey_history
    def initialize
        @entry_station
        @journey_history = []
    end

    def start_journey(entry_station)
        @entry_station = entry_station
    end

    def finish_journey(exit_station)
        @journey_history << {@entry_station => exit_station}
        @entry_station = nil
    end

    def calculate_fair

    end

    def in_journey?
        @entry_station
    end
end