class ProductsController < ApplicationController
 
# def index
#    @product = Product.paginate(:page => params[:page], :per_page => 5) 
# end 
  
 def show
   @product = Product.find(params[:id])
 end 
  
 def edit
   @product = Product.find(params[:id])
 end 
 
 def shopping
   
   @buy = Buy.new(:productid => params[:product_id],:userid => current_user.id,:number =>params[:number])
   if @buy.save
     
     @product = Product.find(params[:product_id])
     
   end
   
 end
 
end
