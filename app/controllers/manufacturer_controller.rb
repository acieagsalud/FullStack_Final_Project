class ManufacturerController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:name)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end
end
