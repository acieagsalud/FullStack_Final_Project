class CheckoutController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @order = Order.new
  end

  def create_order
    # Order.create(order_date: DateTime.now, gst: 0.05, pst: 0.07, total: 400.00, subtotal: 382.00, status: paid, stripe_id: DateTime.now.to_s, user_id: 1)
    # gst: gst, pst: pst, total: total, subtotal: total, user_id: id
    gst = params[:gst].to_d
    pst = params[:pst].to_d
    total = params[:total].to_d
    subtotal = params[:subtotal].to_d
    user_id = params[:user_id].to_i
    @order = Order.create(order_date: DateTime.now,
                          gst:        gst,
                          pst:        pst,
                          total:      total,
                          subtotal:   subtotal,
                          status:     "new",
                          stripe_id:  "payment not processed",
                          user_id:    user_id)
    session[:order] = @order.id
  end

  def update_order
    # Order.update 1, status: "new"
    Order.update session[:order].to_i, status: "paid", stripe_id: session[:stripe_id]
    session[:order] = nil
    session[:cart] = nil
    session[:stripe_id] = nil
    redirect_to root_path
  end
end
