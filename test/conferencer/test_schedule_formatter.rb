require "helper"
require "conferencer/schedule_formatter"

module Conferencer
  class TestScheduleFormatter < ConferencerTest
    def test_print_format
      talk1 = Talk.new("Talk 1 60min", "09:00AM")
      talk2 = Talk.new("Talk 2 60min", "10:00AM")
      talk3 = Talk.new("Talk 3 45min", "3:00PM")
      talk4 = Talk.new("Talk 4 5min", "3:45PM")

      track1 = Track.new("Track 1", [talk1, talk2], [talk3, talk4])
      track2 = Track.new("Track 2", [talk1, talk2], [talk3, talk4])

      output = capture_stdout do
        Conferencer::ScheduleFormatter.new([track1, track2]).print
      end.string

      expected_output = <<-eos.gsub /^\s+/, ""
        Track 1:
        09:00AM Talk 1 60min
        10:00AM Talk 2 60min
        12:00PM Lunch
        3:00PM Talk 3 45min
        3:45PM Talk 4 5min
        5:00PM Networking Event

        Track 2:
        09:00AM Talk 1 60min
        10:00AM Talk 2 60min
        12:00PM Lunch
        3:00PM Talk 3 45min
        3:45PM Talk 4 5min
        5:00PM Networking Event
      eos

      assert_equal output, expected_output
    end
  end
end
