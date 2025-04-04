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

  def create
    @listing = Listing.new(listing_params)
    respond_to do |format|
      if @listing.save!
        raise @listing.inspect
      else
        flash[:alert] = "could not create new schedule becuase #{@listing.joined_errors}"
        format.html
        # format.turbo_stream { render(layout: false) }
      end
    end
  end

  def update; end

  private

  def listing_params
    params.require(:listing).permit(:name, :external_listing_name, :internal_listing_name, :description, :state,
                                    :city, :street, :address, :zipcode, :price, :bedrooms_number, :beds_number, :cleaning_fee, :bathrooms_number)
  end
end

