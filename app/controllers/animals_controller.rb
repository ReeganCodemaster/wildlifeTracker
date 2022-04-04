class AnimalsController < ApplicationController
    def index
        @animals = Animal.all
    end

    def show 
        @animal = Animal.find(params[:id])
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

    def edit
        @animal = Animal.find(params[:id])
    end

    def update
        @animal = Animal.find(parms[:id])

        if @animal.update(animal_params)
            redirect_to @animal
        else 
            render :edit , status: :unprocessable_entity
        end
    end

    def destroy
        @animal = Animal.find(params[:id])

        @animal.destroy

        redirect_to root_path , status: :see_other
    end

    private
    def animal_params()
        params.require(:animal).permit(:animal)
    end
end
