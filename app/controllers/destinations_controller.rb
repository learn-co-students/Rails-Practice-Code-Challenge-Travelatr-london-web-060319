class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end
    def show
        @destination = Destination.find(params[:id])
    end

    private
    def params_destination(*args)
        params.require(:destination).permit(*args)
    end
end