class FuelService
    def self.conn
        Faraday.new(url: "https://developer.nrel.gov") do |faraday| 
            faraday.request :url_encoded
            faraday.adapter  Faraday.default_adapter
            # faraday.headers["api_key"] = ENV["da_key"]
        end 
    end 

    def self.nearby_stations(zip)
        #figure out faraday key handling later 
        params = "?api_key=#{ENV["da_key"]}&location=#{zip}"
        JSON.parse(conn.get("/api/alt-fuel-stations/v1/nearest.json#{params}").body) 
    end

    def self.nearest_stations(zip)
        response = elec_or_prop(zip)
        nearest_stations = response
        nearest_stations.sort_by do |station|
            station["distance"]
        end.reverse.shift(10)
    end 

    def self.elec_or_prop(zip)
        all_stations = nearby_stations(zip)["fuel_stations"]
        filtered = all_stations.find_all do |station|
            station["fuel_type_code"] == ("ELEC" || "PROP")
        end
    end 
end 