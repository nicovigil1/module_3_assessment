class SearchController < ApplicationController
    def index 
        @closest_stations = FuelStation.gen_10_nearest(params[:q])
    end 
end 