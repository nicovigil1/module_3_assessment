require "rails_helper"

describe "fuel station has:" do
    it 'attributes' do 
        response = FuelService.nearby_stations
        fs = FuelStation.new(response)
        
        expect(fs)
    end 
    
end
