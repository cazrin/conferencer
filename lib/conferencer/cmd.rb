require "conferencer/conference"

module Conferencer
  class CMD
    def self.execute(payload)
      talks = payload.split("\n").map { |line| Talk.new(line) }

      conference = Conference.new(talks)
      conference.build_schedule!

      conference.full_schedule
    end
  end
end
