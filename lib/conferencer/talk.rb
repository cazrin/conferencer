module Conferencer
  class Talk
    LIGHTNING_TALK_LENGTH = 5

    attr_accessor :time
    attr_reader :length, :title

    def initialize(payload, time=nil)
      @length = talk_length(payload)
      @time = time
      @title = payload
    end

    private

    def talk_length(payload)
      length = payload.split(" ").pop
      length == "lightning" ? LIGHTNING_TALK_LENGTH : length.to_i
    end
  end
end
