require "rails_helper"

describe "the fuel helper can" do
    it 'connect to api' do 
        fs = FuelService.call
        expect(fs.class).to eq(Faraday::Connection)
    end 
end
