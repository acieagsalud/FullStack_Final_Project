class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart
  before_action :authorized

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to "/welcome" unless logged_in?
  end

  private

  def initialize_session
    @user_id = session[:user]
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart].map { |id, qty| [Product.find(id.to_i), qty] }.to_h
    @total = session[:total]
  end
end
