class Api::V1::VacanciesController < ActionController::API
  def index
    @q = Vacancy.includes(:employer).ransack(params[:q])
    # todo https://github.com/rails/jbuilder
    @vacancies = @q.result.page(params[:page])
  end
end
