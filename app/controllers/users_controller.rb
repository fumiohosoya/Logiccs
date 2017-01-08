class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.save
    if user.save
    else
      render 'new'
  end
 end

 private
 
 def user_params
   params.require(:user).permit(:name, :email, :password,
                                password_confirmation)
 end
end

