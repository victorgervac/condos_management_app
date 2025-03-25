class CleaningsController < ApplicationController
  include Pagy::Backend
  def index
    @cleanings = Cleaning.all
    @pagy, @records = pagy(@cleanings, items: @per_page)
  end
end
