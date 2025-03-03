class DashboardsController < ApplicationController
  def index
    @todays_cleaning_tasks = CleaningTask.where(cleaning_date: Date.today)
  end
end
