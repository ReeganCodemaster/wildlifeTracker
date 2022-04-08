class RegionsController < ApplicationController
    before_action :set_region , only: %i[show edit update destroy]
    
    def index
      @regions = Region.all()
    end

    def new
      @region = Region.new()
    end

    def create
      @region = Region.new(region_params)
        
      if @region.save
        redirect_to @region
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @region.update(region_params)
        redirect_to @region
      else 
        render :edit , status: :unprocessable_entity 
      end
    end
    
    def destroy
      @region.destroy

      redirect_to "/regions", status: 303
    end
    
    private

    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:region)
    end
end
