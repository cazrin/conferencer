module Conferencer
  class Talk
    LIGHTNING_TALK_LENGTH = 5

    attr_reader :length, :title

    def initialize(payload)
      payload_chunks = payload.split(" ")
      length = payload_chunks.pop

      @length = length == "lightning" ? LIGHTNING_TALK_LENGTH : length.to_i
      @title = payload_chunks.join(" ")
    end
  end
end
