class PagesController < ApplicationController
  def permalink
    @page = Page.find_by(permalink: params[:permalink])

    redirect_to root_path if @page.nil?
  end

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end
end
