require "conferencer/conference"
require "conferencer/schedule_formatter"

module Conferencer
  class CMD
    def self.execute(payload)
      talks = payload.split("\n").map { |line| Talk.new(line) }

      conference = Conference.new(talks)
      conference.build_schedule!

      schedule = conference.full_schedule
      ScheduleFormatter.new(schedule).print
    end
  end
end
