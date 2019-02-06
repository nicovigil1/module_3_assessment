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
        conn.get("/api/alt-fuel-stations/v1/nearest.json#{params}")
    end

    def self.nearest_stations(reponse)

    end 
end 