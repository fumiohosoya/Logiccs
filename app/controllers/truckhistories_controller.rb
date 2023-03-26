class TruckhistoriesController < ApplicationController
    def create
        t = Truckhistory.new(hist_params)
        truck = t.truck
        binding.pry
        max = (truck.truckhistories.any?) ? 
            truck.truckhistories.maximum(:mileage) : truck.initmileage
        if (max >= t.mileage.to_i)
            redirect_to current_user, alert: "Mileage under value input of previous"
        elsif (t.save)
            redirect_to current_user
        else
            redirect_to current_user, alert: "failed to update"
        end
    end
    
    private
    
    def hist_params
        params.require(:truckhistory).permit(:truck_id, :action, :mileage)
    end
end
