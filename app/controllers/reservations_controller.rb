class ReservationsController < ApplicationController
  include Pagy::Backend
  def index
    AuthHostAway.run(data_type: params[:fetch_data]) if params[:fetch_data]
    @reservastions = Reservation.all
    @per_page = params[:per_page].nil? ? 10 : params[:per_page]
    @pagy, @records = pagy(@reservastions, items: @per_page)
  end
end
