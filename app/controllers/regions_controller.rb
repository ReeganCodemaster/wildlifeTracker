class RegionsController < ApplicationController
    def index
        @regions = Region.all()
    end

    def show
        @region = Region.find(params[:id])
    end

    def new
        @region = Region.new()
    end

    def create
        @region = Region.new(region_params)
        
        if region.save
            redirect_to @region
        else
            redirect_to :new, status: :unprocessable_entity
        end
    end

    private
    def region_params
        params.require(:region).permit(:region)
    end
end
