class CleaningsController < ApplicationController
  include Pagy::Backend
  def index
    if params[:fetch_data]
      AuthHostAway.run
      render dashboards_path
    else
      @cleanings = Cleaning.all
      @pagy, @records = pagy(@cleanings, items: @per_page)
    end
  end
end
