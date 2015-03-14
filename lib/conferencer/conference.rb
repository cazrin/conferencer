module Conferencer
  class Conference
    attr_reader :track_1, :track_2

    def initialize(talks)
      @talks = talks
      @track_1 = []
      @track_2 = []
    end

    def build_schedule!
    end

    def full_schedule
    end
  end
end
