class FuelService
    def self.call
        conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday| 
            faraday.request :url_encoded
            faraday.adapter  Faraday.default_adapter
            faraday.headers["api_key"] = ENV["da_key"]
        end 
    end 
end 