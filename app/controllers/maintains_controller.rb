class MaintainsController < ApplicationController
    
  def nextadj(init, interval, ml)

    for i in 1..5000 
      if (ml < (a = init + (interval * i)))
        return a
      end
    end
  end
    
  def auto_adj(truck)
    maintains = truck.maintains
    interval = truck.wheels >=8 ? 40000: 20000
    init = truck.initmileage
    ml = init + interval
    max = 0
    maintains.each do |m|
      if (m.mileage <= max)
     	   m.delete
     	   #puts "over #{m.mileage.to_s} < #{max} \n"
      else
         max = m.mileage
         #puts ">>>>>mileage #{m.mileage}  nextmileage #{nextadj(init, interval, m.mileage)} \n"
         m.nextmileage = nextadj(init, interval, m.mileage)
         m.save
      end
    end
  end
        
        
    def create
        @truck = Truck.find(params[:maintain][:truck_id])
        max = (@truck.maintains.any?) ?
            @truck.maintains.map {|e| e.mileage.to_i}.max : @truck.initmileage
        @maintain = @truck.maintains.build(maintain_params)
        if (max >= @maintain.mileage.to_i)
            flash[:success] = "Error: Lower mileage than previous value #{max}> input#{@maintain.mileage.to_i}"
            render 'trucks/adjust'
        elsif (@maintain.save)
            his = @truck.truckhistories.build(truck_id: @truck.id,
                action: Time.now.strftime("%Y/%m/%d"), mileage: params[:maintain][:mileage])
            his.save
            flash[:success] = "Truck information Adjusted"
            auto_adj(@truck)
            redirect_to trucks_url
        else
            flash[:error] = "Truck info not adjusted"
            render 'trucks/adjust'
            
        end
    end
    
    def update
        @maintain = Maintain.find(params[:id])
        @truck = @maintain.truck
        max = (@truck.maintains.any?) ?
            Maintain.where(truck_id: @maintain.truck)
                .where("id < #{@maintain.id}").map{|e| e.mileage.to_i}.max
              : @truck.initmileage
          input_mileage = maintain_params[:mileage].to_i
        if (max >= input_mileage)
            flash[:success] = "Error: Lower mileage than previous value #{max}> input#{input_mileage}"
            @maintains = @maintain.truck.maintains
            render 'trucks/adjustmileage'
        elsif (@maintain.update(maintain_params))
            flash[:success] = "Maintainance Record Adjusted Done"
            auto_adj(@maintain.truck)
            redirect_to :back 
        else
            flash[:error] = "Please Input Correct Data"
            redirect_to :back 
        end
    end
    
    private
    
    def maintain_params
        params.require(:maintain).permit(:action, :mileage, :nextmileage, :content)
    end
end
