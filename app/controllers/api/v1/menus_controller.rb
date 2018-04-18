class Api::V1::MenusController < ActionController::API
  def index
    @categories = Category.all
    @schedules = Vacancy.schedules
  end
end
