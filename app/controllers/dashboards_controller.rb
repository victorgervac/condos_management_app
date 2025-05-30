class DashboardsController < ApplicationController
  include Pagy::Backend
  def index
    @per_page = params[:per_page].nil? ? 10 : params[:per_page]

    @todays_cleaning_tasks = CleaningTask.all
    @pagy, @records = pagy(@todays_cleaning_tasks, items: @per_page)
    AuthHostAway.run(data_type: params[:fetch_data]) if params[:fetch_data]
    @listtings = Listing.all
    # where(cleaning_date: Date.today..(Date.tomorrow + 5.days))
  end
end
