class ChargesController < ApplicationController
  def new; end

  def create
    # Amount in cents
    @amount = (session[:total].to_d * 100).to_i
    session[:stripe_id] = params[:stripeToken]
    customer = Stripe::Customer.create({
                                         email:  params[:stripeEmail],
                                         source: params[:stripeToken]
                                       })

    charge = Stripe::Charge.create({
                                     customer:    customer.id,
                                     amount:      @amount,
                                     description: "Rails Stripe customer",
                                     currency:    "cad"
                                   })
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
