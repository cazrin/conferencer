require "helper"
require "conferencer/cmd"

class TestCMD < ConferencerTest
  def test_execute_with_payload
    input = <<-eos.gsub /^\s+/, ""
      Writing Fast Tests Against Enterprise Rails 60min
      Overdoing it in Python 45min
      Lua for the Masses 30min
      Ruby Errors from Mismatched Gem Versions 45min
      Common Ruby Errors 45min
      Rails for Python Developers lightning
      Communicating Over Distance 60min
      Accounting-Driven Development 45min
      Woah 30min
      Sit Down and Write 30min
      Pair Programming vs Noise 45min
      Rails Magic 60min
      Ruby on Rails: Why We Should Move On 60min
      Clojure Ate Scala (on my project) 45min
      Programming in the Boondocks of Seattle 30min
      Ruby vs. Clojure for Back-End Development 30min
      Ruby on Rails Legacy App Maintenance 60min
      A World Without HackerNews 30min
      User Interface CSS in Rails Apps 30min
    eos

    expected_output = <<-eos
Track 1:
09:00AM Writing Fast Tests Against Enterprise Rails 60min
10:00AM Overdoing it in Python 45min
10:45AM Lua for the Masses 30min
11:15AM Ruby Errors from Mismatched Gem Versions 45min
12:00PM Lunch
01:00PM Common Ruby Errors 45min
01:45PM Rails for Python Developers lightning
01:50PM Communicating Over Distance 60min
02:50PM Accounting-Driven Development 45min
03:35PM Woah 30min
04:05PM Sit Down and Write 30min
05:00PM Networking Event

Track 2:
09:00AM Pair Programming vs Noise 45min
09:45AM Rails Magic 60min
10:45AM Ruby on Rails: Why We Should Move On 60min
12:00PM Lunch
01:00PM Clojure Ate Scala (on my project) 45min
01:45PM Programming in the Boondocks of Seattle 30min
02:15PM Ruby vs. Clojure for Back-End Development 30min
02:45PM Ruby on Rails Legacy App Maintenance 60min
03:45PM A World Without HackerNews 30min
04:15PM User Interface CSS in Rails Apps 30min
05:00PM Networking Event

eos

    output = capture_stdout do
      Conferencer::CMD.execute(input)
    end.string

    assert_equal expected_output, output
  end
end
