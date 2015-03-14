require "conferencer/track"

module Conferencer
  class Conference
    MORNING_SESSION_MAX_MINS = 180
    AFTERNOON_SESSION_MAX_MINS = 240

    SECONDS_PER_MINUTE = 60

    attr_reader :track_1, :track_2

    def initialize(talks)
      @talks = talks
    end

    def build_schedule!
      @track_1 = Track.new("Track 1", morning_talks, afternoon_talks)
      @track_2 = Track.new("Track 2", morning_talks, afternoon_talks)
    end

    def full_schedule
      [@track_1, @track_2]
    end

    private

    def format_time(time)
      time.strftime("%I:%M%p")
    end

    def morning_talks
      mins = 0
      time = Time.new(2015, 1, 1, 9, 0, 0)

      @talks.map do |talk|
        next unless talk.time.nil?

        if mins + talk.length <= MORNING_SESSION_MAX_MINS
          talk.time = format_time(time)

          mins += talk.length
          time += talk.length * SECONDS_PER_MINUTE

          talk
        end
      end.compact
    end

    def afternoon_talks
      mins = 0
      time = Time.new(2015, 1, 1, 13, 0, 0)

      @talks.map do |talk|
        next unless talk.time.nil?

        if mins + talk.length <= AFTERNOON_SESSION_MAX_MINS
          talk.time = format_time(time)

          mins += talk.length
          time += talk.length * SECONDS_PER_MINUTE

          talk
        end
      end.compact
    end
  end
end
