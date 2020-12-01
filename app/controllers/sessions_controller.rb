class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]
  def new; end

  def set_province
    session[:province] = params[:province]
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/welcome"
    else
      redirect_to "/login"
    end
  end

  def page_requires_login; end

  def login; end

  def welcome
    @orders = Order.where(user_id: session[:user_id].to_i).order(order_date: :desc)
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end
end
