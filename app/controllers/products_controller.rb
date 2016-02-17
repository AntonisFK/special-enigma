class ProductsController < ApplicationController
  def index
 	@products = User.all
  end

  def create
  	product = Product.new(name: params[:product][:name], price: params[:product][:price], user: current_user)
  	flash[:success] = "Product added!" if product.save
  	p product 
  	redirect_to current_user
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy if product.user == current_user
    redirect_to current_user
  end



end
