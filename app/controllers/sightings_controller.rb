class SightingsController < ApplicationController
    before_action :set_sighting, only: %i[show edit update destroy]
    before_action :set_animal

    def index 
      if (params[:begin_date].present?) and (params[:end_date].present?)
        begin_date, end_date = params[:begin_date].to_date, params[:end_date].to_date
        @sightings = @animal.sightings.where(date: begin_date..end_date).and(@animal.sightings.where(region_id: params[:region_id]))
      else
        @sightings = @animal.sightings.all
      end
    end

    def new
      @animal   = Animal.find(params[:animal_id])
      @sighting = @animal.sightings.new()
    end

    def create
      @sighting = Sighting.new(sightings_params.merge(animal_id: params[:animal_id]))
        
      if @sighting.save
        redirect_to animal_path(@animal)
      else 
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @sighting.update(sightings_params)
        redirect_to @animal
      else 
        redirect_to edit_animal_sighting_path
      end
    end

    def destroy
      @sighting.destroy
      redirect_to animal_path(@animal), status: 303
    end

    private
    
    def set_sighting
      @sighting = Sighting.find(params[:id])
    end

    def set_animal
      @animal = Animal.find(params[:animal_id])
    end

    def sightings_params
      params.require(:sighting).permit(:animal, :date, :longitude, :latitude, :region_id)
    end
end
