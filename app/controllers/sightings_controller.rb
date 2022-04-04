class SightingsController < ApplicationController
    def create
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.create(sightings_params)
        redirect_to animal_path(@animal)
    end

    private
    def sightings_params()
        params.require(:sighting).permit(:animal, :date, :longitude, :latitude)
    end
end
