require "helper"
require "conferencer/schedule_formatter"

class TestScheduleFormatter < ConferencerTest
  def test_print_format
    talk1 = Conferencer::Talk.new("Talk 1 60min", "09:00AM")
    talk2 = Conferencer::Talk.new("Talk 2 60min", "10:00AM")
    talk3 = Conferencer::Talk.new("Talk 3 45min", "3:00PM")
    talk4 = Conferencer::Talk.new("Talk 4 5min", "3:45PM")

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

class Track
  attr_reader :afteroon_session, :morning_session, :title

  def initialize(title, morning_session, afternoon_session)
    @afternoon_session = afternoon_session
    @morning_session = morning_session
    @title = title
  end

  def talks
    @morning_session + [lunch_event] + @afternoon_session + [evening_event]
  end

  private

  def lunch_event
    OpenStruct.new(:time => "12:00PM", :title => "Lunch")
  end

  def evening_event
    OpenStruct.new(:time => "5:00PM", :title => "Networking Event")
  end
end
