require "san_fran_movlocations/version"

module SanFranMovlocations
  class Location

    attr_reader :location, :title, :actor_1, :actor_2

    def initialize(hash)
      @location = hash["locations"]
      @title = hash["title"]
      @actor_1 = hash["actor_1"]
      @actor_2 = hash["actor_2"]
    end

    def self.all? 
      locations_array = Unirest.get("http://data.sfgov.org/resource/wwmu-gmzc.json").body
      location = []
      locations_array.each do |location_hash|
            locations << Location.new(location_hash)
          end
          return locations
      end
    end
  end
end
