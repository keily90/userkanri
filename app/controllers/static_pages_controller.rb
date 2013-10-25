class StaticPagesController < ApplicationController
  def home
     @product = Product.paginate(:page => params[:page], :per_page => 5) 
  end

  def help
     
     
    
  end
end
