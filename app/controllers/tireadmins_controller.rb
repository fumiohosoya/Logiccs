class TireadminsController < ApplicationController

  before_action :tireadminlogged_in_user, only:[:list, :destroy]

  def new
     
  end
  
  def create
      @tireadmin_user = Tireadmin.find_by(email: params[:tireadmin][:email].downcase)
#      binding.pry
      if @tireadmin_user && @tireadmin_user.authenticate(params[:tireadmin][:password])
        session[:tireadmin_id] = @tireadmin_user.id
        flash[:info] = "logged in as TireAdmin- #{@tireadmin_user.name}"

        redirect_to tireadminpanel_url(@tireadmin_user)
      else
        flash[:danger] = 'invalid email/password combination'
        render 'new'
      end
  end
  
  def destroy
    session[:admin_id] = nil
    session[:user_id] = nil
    session[:tireadmin_id] = nil
    redirect_to root_url
  end
  
  def list
     @tireadmin = Tireadmin.find(params[:id]) 
     company = @tireadmin.company
     branch = @tireadmin.branch
     @mytrucks = branch.trucks
  end
  
  def dashboard
    @user = Tireadmin.find(params[:id])
    @companies = Company.all
    @branches = (@user != nil) ? Branch.where(company_id: @user.company_id) : {}
    @mytrucks = Truck.where(company_id: @user.company_id, branch_id: @user.branch_id)

#    @mytrailers = @user.trailers
    @mytrailers = Trailer.where(company_id: @user.company_id, branch_id: @user.branch_id)
  end


  private
  
  # def admin_params
  #   params.require(:admin).permit(:name, :email, :password)
  # end

end
