class SightingsController < ApplicationController
    def new
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.new()
        @regions = Region.all
    end

    def create
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.new(sightings_params)
        
        if @sighting.save
            redirect_to animal_path(@animal)
        else 
            redirect_to new_animal_sighting_path
        end
    end

    def edit
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.find(params[:id])
    end

    def update
        # if save works -> redirect the animal page
        # if save fails -> redirect the edit form
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.find(params[:id])

        if @sighting.update(sightings_params)
            redirect_to @animal
        else 
            redirect_to edit_animal_sighting_path
        end
    end

    def destroy
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.find(params[:id])

        @sighting.destroy
        redirect_to animal_path(@animal), status: 303
    end


    private
    def sightings_params
        params.require(:sighting).permit(:animal, :date, :longitude, :latitude)
    end
end
