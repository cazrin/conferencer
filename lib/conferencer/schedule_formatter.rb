module Conferencer
  class ScheduleFormatter
    def initialize(tracks)
      @tracks = tracks
    end

    def print
      @tracks.each { |track| print_track(track) }
    end

    private

    def print_track(track)
      puts "#{track.title}:"

      track.talks.each do |talk|
        puts "#{talk.time} #{talk.title}"
      end
    end
  end
end
