ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :description, :price, :sale_price, :sale_expiry, :stock_qty, :manufacturer_id, :subcategory_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :sale_price, :sale_expiry, :stock_qty, :manufacturer_id, :subcategory_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
