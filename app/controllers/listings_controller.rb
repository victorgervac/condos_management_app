class ListingsController < ApplicationController
  include Pagy::Backend
  def index
    @listings = Listing.all
    @pagy, @records = pagy(@listings, items: @per_page)
  end
end
