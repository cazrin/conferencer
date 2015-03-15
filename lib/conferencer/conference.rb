require "conferencer/track"

module Conferencer
  class Conference
    SESSIONS = {
      :morning => {
        :max_mins => 180,
        :start_hour => 9
      },

      :afternoon => {
        :max_mins => 240,
        :start_hour => 13
      }
    }

    SECONDS_PER_MINUTE = 60

    attr_reader :track_1, :track_2

    def initialize(talks)
      @talks = talks
    end

    def build_schedule!
      @track_1 = Track.new("Track 1", session_talks(SESSIONS[:morning]), session_talks(SESSIONS[:afternoon]))
      @track_2 = Track.new("Track 2", session_talks(SESSIONS[:morning]), session_talks(SESSIONS[:afternoon]))
    end

    def full_schedule
      [@track_1, @track_2]
    end

    private

    def format_time(time)
      time.strftime("%I:%M%p")
    end

    def session_talks(session)
      mins = 0
      time = Time.new(2015, 1, 1, session[:start_hour], 0, 0)

      @talks.map do |talk|
        next unless talk.time.nil?

        if mins + talk.length <= session[:max_mins]
          talk.time = format_time(time)

          mins += talk.length
          time += talk.length * SECONDS_PER_MINUTE

          talk
        end
      end.compact
    end
  end
end
