require "helper"
require "conferencer/track"

module Conferencer
  class TestTrack < ConferencerTest
    def setup
      @track = Track.new("Track Title", [
        OpenStruct.new(:title => "Talk 1"),
        OpenStruct.new(:title => "Talk 2"),
      ], [
        OpenStruct.new(:title => "Talk 3"),
      ])
    end

    def test_track_title
      assert_equal "Track Title", @track.title
    end

    def test_talks_concatenates_sessions_and_events
      assert_equal [
        "Talk 1",
        "Talk 2",
        "Lunch",
        "Talk 3",
        "Networking Event"
      ], @track.talks.map(&:title)

      assert_equal [
        nil,
        nil,
        "12:00PM",
        nil,
        "5:00PM"
      ], @track.talks.map(&:time)
    end
  end
end
