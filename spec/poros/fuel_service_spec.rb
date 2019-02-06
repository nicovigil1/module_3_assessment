require "rails_helper"

describe "the fuel helper can" do
    it 'connect to api' do 
        fs = FuelService.conn
        expect(fs.class).to eq(Faraday::Connection)
    end 

    it 'get a response of what gas stations are in a specific zip' do 
        nearby = FuelService.nearby_stations(80203)
        
        expect(nearby["fuel_stations"]).to be_truthy
    end 

    it 'can find the 10 nearest stations' do 
        nearest = FuelService.nearest_stations(80203)

        expect(nearest.length).to eq(10)
        expect(nearest.first["access_code"]).to be_truthy
    end 

    it 'can find stations that are either electric or propane' do 
        stations = FuelService.elec_or_prop

        expect(stations.first["fuel_type"]).to_not eq("test")  
    end 
    
end
