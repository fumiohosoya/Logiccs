class TrucksController < ApplicationController
  
  before_action :adminlogged_in_user, only:[:new]

  def index
    @companies = Company.all
    if (params[:company])
      @target_c = @companies.find(params[:company])
    else
      @target_c = @companies.first
    end
    @trucks = Truck.where(company_id: @target_c).order(:company_id, :branch_id, :number)
    
  end
  
  def all
    @branch = Branch.find(params[:branch_id])
    
    if (@branch != nil)
      @trucks = @branch.trucks.order("created_at ASC")
      if (@trucks == nil) 
        render json: { error: '404 error' }, status: 404
      else
        render json: @trucks
      end
    else
        render json: { error: '404 error' }, status: 404
    end
    
  end
  
  def numbershow
    @truck = Truck.find_by(number: params[:number])
    if (@truck == nil) 
        render json: { error: '404 error' }, status: 404
    else
      render json: @truck
    end
  end
  
  def json
    @truck= Truck.find_by(id: params[:id])
    if (@truck == nil) 
        render json: { error: '404 error' }, status: 404
    else
      render json: @truck
    end
  end
    
  def new
    @companies = Company.preload(:branches)
    @branches =  (@user != nil) ? Branch.where(company_id: @user.id) : {}
    @truck = Truck.new
  end
  
  
  def params_copy
 #    data: {company : company_id, branch: branch_id, model: modelname},
 
     @truck = Truck.where(company_id: params[:company], branch_id: params[:branch], model: params[:model]).last
  end
  
  
  def create
    @truck = Truck.new(truck_params)
    if (@truck.save)
      if @truck.initmileage.present?
          @truck_history = @truck.truckhistories.build(
            truck_id: @truck.id, action: Time.now,
            mileage: @truck.initmileage)
          @truck_history.save
      end
      redirect_to @truck
    else
     @companies = Company.preload(:branches)
     @branches =  (current_user != nil) ? Branch.where(company_id: current_user.company.id) : {}

      flash.now[:alert] = "failed to register"
      render 'new'
    end
  end
  
  def edit
    @truck = Truck.find(params[:id])
    @companies = Company.preload(:branches)
    @branches =  Branch.where(company_id: @truck.company.id)
  end
  
  def update
    @truck = Truck.find(params[:id])
    @companies = Company.preload(:branches)
    @branches =  Branch.where(company_id: @truck.company.id)
    if (@truck.update(truck_params))
      redirect_to @truck
    else
      flash[:now] = "Truck update error"
      render 'edit'
    end
  end
  
  def initset
    # To view Truck Initial Mileage form
    @truck = Truck.find(params[:id])  
  end
  
  def recordinit
    @truck = Truck.find(params[:truckhistory][:truck_id])
    initmileage = params[:truckhistory][:mileage]
    @truck.update(initmileage: initmileage)
    @t_histories = @truck.truckhistories
    @t_histories.each {|t|
      t.destroy if t != nil
    }
    th = Truckhistory.new(truck_id: @truck.id, mileage: initmileage)
    if th.save
      redirect_to edit_truck_path(@truck)
    else
      render 'initset'
    end
  end

  def record
    @truck = Truck.find(params[:id])
  end

  def show
    @truck = Truck.find(params[:id])
  end
  
  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy if (@truck)
    redirect_to trucks_url
  end
  
  def adjust
    @truck = Truck.find(params[:id])
    @maintain = @truck.maintains.build
  end
  
  
  def tirerotation
    @truck = Truck.find(params[:id])
    @hist_ar = Array.new
    @hist_ar <<  @truck.tirehistories.where(index: 0).last
    @hist_ar <<  @truck.tirehistories.where(index: 1).last
    @hist_ar <<  @truck.tirehistories.where(index: 2).last
    @hist_ar <<  @truck.tirehistories.where(index: 3).last
    @hist_ar <<  @truck.tirehistories.where(index: 4).last
    if (@truck.wheels > 4)
      @hist_ar <<  @truck.tirehistories.where(index: 5).last
      @hist_ar <<  @truck.tirehistories.where(index: 6).last
    end
    if (@truck.wheels > 6)
      @hist_ar <<  @truck.tirehistories.where(index: 7).last
      @hist_ar <<  @truck.tirehistories.where(index: 8).last
    end
    if (@truck.wheels > 8)
      @hist_ar <<  @truck.tirehistories.where(index: 9).last
      @hist_ar <<  @truck.tirehistories.where(index: 10).last
    end
    
    if (@truck.wheels == 10)
        render :rotation_10
    elsif (@truck.wheels == 8)
        render :rotation_8
    elsif (@truck.wheels == 6)
        render :rotation_6
    elsif (@truck.wheels == 4)
        render :rotation_4
    else
    end
  end
  
  def adhocrotation
    @truck = Truck.find(params[:id])
    @adhocrotations = @truck.adhocrotations
    
  end
  
  def adjustmileage
      @truck = Truck.find(params[:id])
      @maintains = @truck.maintains.order(:id)
  end
  
  def nextadj(init, interval, ml)
  
    for i in 1..5000 
      if (ml < (a = init + (interval * i)))
        return a
      end
    end
  end

  def t_adj(id)
    truck = Truck.find(id)
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
  
private
  def truck_params
    params.require(:truck).permit(:company_id, :branch_id,
             :maker, :model, :body, :wheels, :engine, :vehicleid,
             :number, :purchase, :e_oil, :tm_oil, :tire, :df_oil, :initmileage,
             :image, :dealercompany_id)

  end
end