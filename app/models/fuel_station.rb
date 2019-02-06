class FuelStation
    attr_reader :name, :address, :fuel_type, :distance, :access_times

    def new(response)
        @name = response["station_name"]
        @address = response["street_address"]
        @fuel_type = response["fuel_type"]
        @distance = response["distance"]
        @access_time = response["access_time"]
    end 

    def self.generate(zip)
        FuelService.nearby_stations(zip).map do |station|
            station.new
        end
    end 

end 