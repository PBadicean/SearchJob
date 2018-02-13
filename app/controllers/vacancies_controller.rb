class VacanciesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @vacancies = Vacancy.last(5)
  end

  def show
    @vacancy = Vacancy.find(params[:id])
    @response = @vacancy.responses.new
  end

end
