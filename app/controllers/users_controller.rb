class UsersController < ApplicationController
  def index
  end

  def create
      @user = User.create(user_params)
    puts @user.errors.full_messages
    if @user.errors.count == 0
      flash[:notice] ="You have succesfull loged in"
      session[:user_id] = @user.id 
      redirect_to @user
    else 
      flash[:error] = @user.errors.full_messages
      redirect_to '/main'
    end
  end 

  def new
  @user = User.new 
  @session = User.new 
  end

  def edit
  
  end

  def show
    p @products = User.find(params[:id]).products
    @user = User.find(params[:id]).sales_products
    @sale = User.all 

  end

  def update
  end

  def destroy
  end
  private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end 



end
