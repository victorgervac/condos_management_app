class ListingsController < ApplicationController
  include Pagy::Backend
  def index
    @per_page = params[:per_page].nil? ? 10 : params[:per_page]

    @listings = Listing.all
    @pagy, @records = pagy(@listings, items: @per_page)
  end
end
