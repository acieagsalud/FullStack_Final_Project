class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(username: params[:username], password: params[:password], name: params[:name], email: params[:email], province_id: params[:province], address: params[:address])
    session[:user_id] = @user.id
    redirect_to "/welcome"
  end
end
