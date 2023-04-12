class TruckrelationshipsController < ApplicationController
    
    def create
        @user = User.find(params[:truckrelationship][:user_id])
        if (truck_ids = params[:check_truck_ids]).present?
            truck_ids.each do | truck_id |
                @user.truck_add(truck_id)
            end
        end
        redirect_back( fallback_location: root_path )
    end
    
    def destroy
        @user = User.find(params[:truckrelationship][:user_id])
        t = Truckrelationship.find(params[:id])
        t.destroy if (t != nil)
    #    return redirect_to @user if @user !=nil
        redirect_back( fallback_location: root_path )
    end
end
