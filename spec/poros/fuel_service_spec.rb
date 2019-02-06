require "rails_helper"

describe "the fuel helper can" do
    it 'connect to api' do 
        fs = FuelService.conn
        expect(fs.class).to eq(Faraday::Connection)
    end 

    it 'get a response of what gas stations are in a specific zip' do 
        nearby = FuelService.nearby_stations(80203)

        the_unexpected = JSON.parse(nearby.body)
        
        expect(nearby.status).to eq(200)

        # FIXME: need to find the 10 closest ones. 
        # expect(the_unexpected.length).to eq(10)
    end 

    
end
