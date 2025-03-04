class DashboardsController < ApplicationController
  def index
    @todays_cleaning_tasks = CleaningTask.all
    # where(cleaning_date: Date.today..(Date.tomorrow + 5.days))
  end
end
