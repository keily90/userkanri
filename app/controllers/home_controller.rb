class HomeController < ApplicationController
  
  def index
    
  end
  
  def callback
    @users=Fbuser.all
  end
  
  def show
    
  end
end
