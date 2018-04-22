class Api::V1::VacanciesController < ActionController::API
  def index
    @q = Vacancy.includes(:employer, :category).ransack(params[:q])
    @vacancies = @q.result.page(params[:page])
  end
end
