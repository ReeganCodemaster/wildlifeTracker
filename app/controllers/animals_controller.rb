class AnimalsController < ApplicationController
    before_action :set_animal , only: %i[show edit update destroy]

    def index
      @animals = Animal.all
    end

    def new
      @animal = Animal.new
    end

    def create
      @animal = Animal.new(animal_params)

      if @animal.save
        redirect_to @animal
      else
        render :new , status: :unprocessable_entity
      end
    end

    def update
      if @animal.update(animal_params)
        redirect_to @animal
      else 
        render :edit , status: :unprocessable_entity
      end
    end

    def destroy
      @animal.destroy

      redirect_to root_path , status: :see_other
    end

    private

    def set_animal
      @animal = Animal.find(params[:id])
    end

    def animal_params()
      params.require(:animal).permit(:animal)
    end
end
