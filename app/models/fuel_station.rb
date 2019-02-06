class FuelStation
    attr_reader :name, :address, :fuel_type, :distance, :access_time

    def initialize(response)
        @name = response["station_name"]
        @address = response["street_address"]
        @fuel_type = response["fuel_type_code"]
        @distance = response["distance"]
        @access_time = response["access_days_time"]
    end 

    def self.gen_10_nearest(zip)
        response = FuelService.nearest_stations(zip)
        response.map do |station_info| 
            self.new(station_info)
        end 
    end 

end 