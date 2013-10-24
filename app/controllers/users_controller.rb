class UsersController < ApplicationController
  def new
    @user = User.new
   
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
    else
    
      render 'new'
    end
  end
 
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
end