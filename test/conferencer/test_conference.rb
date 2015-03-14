require "helper"
require "conferencer/conference"

module Conferencer
  class ConferenceTest < ConferencerTest
    def setup
      @conference = Conference.new(talks_fixture)
    end

    def test_build_schedule
      @conference.build_schedule!

      assert_equal [
        ["09:00AM", "Writing Fast Tests Against Enterprise Rails 60min"],
        ["10:00AM", "Overdoing it in Python 45min"],
        ["10:45AM", "Lua for the Masses 30min"],
        ["11:15AM", "Ruby Errors from Mismatched Gem Versions 45min"],
        ["12:00PM", "Lunch"],
        ["01:00PM", "Common Ruby Errors 45min"],
        ["01:45PM", "Rails for Python Developers lightning"],
        ["01:50PM", "Communicating Over Distance 60min"],
        ["02:50PM", "Accounting-Driven Development 45min"],
        ["03:35PM", "Woah 30min"],
        ["04:05PM", "Sit Down and Write 30min"],
        ["05:00PM", "Networking Event"]
      ], talk_time_and_titles(@conference.track_1)

      assert_equal [
        ["09:00AM", "Pair Programming vs Noise 45min"],
        ["09:45AM", "Rails Magic 60min"],
        ["10:45AM", "Ruby on Rails: Why We Should Move On 60min"],
        ["12:00PM", "Lunch"],
        ["01:00PM", "Clojure Ate Scala (on my project) 45min"],
        ["01:45PM", "Programming in the Boondocks of Seattle 30min"],
        ["02:15PM", "Ruby vs. Clojure for Back-End Development 30min"],
        ["02:45PM", "Ruby on Rails Legacy App Maintenance 60min"],
        ["03:45PM", "A World Without HackerNews 30min"],
        ["04:15PM", "User Interface CSS in Rails Apps 30min"],
        ["05:00PM", "Networking Event"]
      ], talk_time_and_titles(@conference.track_2)
    end

    private

    def talk_time_and_titles(track)
      track.map do |talk|
        [talk.time, talk.title]
      end
    end
  end
end
