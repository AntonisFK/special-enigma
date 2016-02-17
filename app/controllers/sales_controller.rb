class SalesController < ApplicationController
  def create
  	sale = Sale.create(user: current_user, product: Product.find(params[:id]))
  	redirect_to current_user
  end

  def destroy
  end
end
