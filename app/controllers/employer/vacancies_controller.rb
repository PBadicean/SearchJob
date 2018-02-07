class Employer::VacanciesController < Employer::BaseController

  before_action :set_employer, only: :index
  before_action :set_vacancy, only: [:edit, :update, :destroy]

  def index
    @vacancies = @employer.vacancies.page(params[:page])
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = current_user.vacancies.new(vacancy_params)
    flash[:notice] = t('messages.vacancies.created')
    if @vacancy.save
      redirect_to employer_vacancies_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @vacancy.update(vacancy_params)
      flash[:notice] = t('messages.vacancies.updated')
      redirect_to employer_vacancies_path
    else
      render :edit
    end
  end

  def destroy
    @vacancy.destroy
    flash[:notice] = t('messages.vacancies.destroyed')
    redirect_to employer_vacancies_path
  end

  private

   def vacancy_params
    params.require(:vacancy).permit(
      :name, :salary_start, :salary_end, :discription, :experience,
      :user_id, :key_skills, :place_id, :schedule, :category_id
    )
   end

  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def set_employer
    @employer = Employer.find(current_user.id)
  end

end
