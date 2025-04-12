class ListingsController < ApplicationController
  include Pagy::Backend
  def index
    AuthHostAway.run(data_type: params[:fetch_data]) if params[:fetch_data]
    @per_page = params[:per_page].nil? ? 10 : params[:per_page]

    @listings = Listing.all
    @pagy, @records = pagy(@listings, items: @per_page)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    respond_to do |format|
      if @listing.save!
        format.html { redirect_to listings_path, notice: 'Succefully created listing' }
      else
        format.html do
          redirect_to request.referrer, alert: "could not create new listing becuase #{@listing.joined_errors}"
        end
      end
    end
  end

  def update
    @listing = Listing.find(listing_params[:id])
    respond_to do |format|
      if @listing.update!
        format.html { redirect_to listing_path(@listing.id), notice: 'Succefully updated listing' }
      else
        format.html do
          redirect_to request.referrer, alert: "could not create new listing becuase #{@listing.joined_errors}"
        end

      end
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    respond_to do |format|
      if @listing.delete
        format.html { redirect_to listings_path, notice: 'Succefully deleted listing' }
      else
        format.html do
          redirect_to request.referrer, alert: "could not deleted listing becuase #{@listing.joined_errors}"
        end

      end
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:id, :name, :external_listing_name, :internal_listing_name, :description, :state,
                                    :city, :street, :address, :zipcode, :price, :bedrooms_number, :beds_number, :cleaning_fee, :bathrooms_number)
  end
end
