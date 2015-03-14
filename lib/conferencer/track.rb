require "ostruct"

module Conferencer
  class Track
    include Enumerable

    attr_reader :afteroon_session, :morning_session, :title

    def initialize(title, morning_session, afternoon_session)
      @afternoon_session = afternoon_session
      @morning_session = morning_session
      @title = title
    end

    def each(&block)
      talks.each(&block)
    end

    def talks
      @morning_session + [lunch_event] + @afternoon_session + [evening_event]
    end

    private

    def lunch_event
      OpenStruct.new(:time => "12:00PM", :title => "Lunch")
    end

    def evening_event
      OpenStruct.new(:time => "05:00PM", :title => "Networking Event")
    end
  end
end
