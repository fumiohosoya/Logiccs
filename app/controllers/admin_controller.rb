class AdminController < ApplicationController

  before_action :adminlogged_in_user, except: [:new, :create]
  
  def listadmin
    @admins = Admin.all
  end

  def new
     
  end
  
  def create
      @admin = Admin.find_by(email: params[:admin][:email].downcase)
      if @admin && @admin.authenticate(params[:admin][:password])
        session[:admin_id] = @admin.id
        flash[:info] = "logged in as Admin- #{@admin.name}"
        redirect_to adminpanel_url
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
  
  def newadmin
    @admin = Admin.new
  end
  
  
  def createadmin
    @admin = Admin.new(admin_params)
    
    if (@admin.save)
      flash[:success] = "New Admin user created"
      redirect_to adminpanel_url
    else
      flash[:error] = "Admin user failed to create"
      render 'newadmin'
    end
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def destroyadmin
    @admin = Admin.find(params[:id])
    @admin.destroy if @admin
    redirect_to adminpanel_url
  end
  
  def newtireadmin
    @tireadmin = Tireadmin.new
    @companies = Company.all
    @branches = []
  end
  
  def createtireadmin
    @tireadmin = Tireadmin.new(tireadmin_params)
    
    if (@tireadmin.save)
      flash[:success] = "New TireAdmin user created"
      redirect_to adminpanel_url
    else
      flash[:error] = "TireAdmin user failed to create"
      render 'newtireadmin'
    end
  end
  
  def edittireadmin
    @tireadmin = Tireadmin.find(params[:id])
    @companies = Company.all
    @branches = @tireadmin.company.branches
  end
  
  def updatetireadmin
    @tireadmin = Tireadmin.find(params[:id])
    
    if (@tireadmin.update(tireadmin_params))
      flash[:success] = "New TireAdmin user updated"
      redirect_to adminpanel_url
    else
      flash[:error] = "TireAdmin user failed to create"
      render 'edittireadmin'
    end
      
  end
    
  
  def listtireadmin
    
    @companies = Company.all
    if (params[:company])
      @target_c = @companies.find(params[:company])
    else
      @target_c = @companies.first
    end
    @tireadmins = Tireadmin.where(company_id: @target_c).order(:company_id, :branch_id)
  end
  
  def deletetireadmin
    @tireadmin = Tireadmin.find(params[:id])
    if (@tireadmin)
      @tireadmin.destroy
    end
    redirect_to listtireadmin_url
  end
  

  def index
  end
  

  def setuser
    @users = User.all.includes(:company)
    company_ids = @users.map {|u| u.company_id}.uniq!.sort!
    @companys = Company.find(company_ids)
  end

  private
  
  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end
  
  def tireadmin_params
    params.require(:tireadmin).permit(:name, :email, :password, :company_id, :branch_id)
  end

end
