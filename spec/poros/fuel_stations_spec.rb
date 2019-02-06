require "rails_helper"

describe "fuel station has:" do
    it 'has attributes and can generate the 10 nearest stations by zip' do 
        stations = FuelStation.gen_10_nearest(80203)
        station = stations.first

        # attributes
        expect(station.name).to be_truthy 
        expect(station.address).to be_truthy 
        expect(station.fuel_type).to be_truthy 
        expect(station.distance).to be_truthy 
        expect(station.access_time).to be_truthy 

        # can generate 10 nearest
        expect(stations.length).to eq(10)
        expect(stations.first.class).to eq(FuelStation)
        expect(stations.first.distance > stations.last.distance)
    end 
    
end
