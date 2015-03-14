module Conferencer
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
end
