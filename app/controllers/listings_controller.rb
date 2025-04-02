class ListingsController < ApplicationController
  include Pagy::Backend
  def index
    @per_page = params[:per_page].nil? ? 10 : params[:per_page]

    @listings = Listing.all
    @pagy, @records = pagy(@listings, items: @per_page)
  end

  def show; end

  def edit; end

  def new
    @listing = Listing.new
  end

  def create; end

  def update; end
end
