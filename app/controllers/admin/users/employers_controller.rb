class Admin::Users::EmployersController < Admin::BaseController

  before_action :set_employer, only: [:edit, :update, :destroy]

  def index
    @q = Employer.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def new
    @employer = Employer.new
    @employer.build_info
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      flash[:notice] = t('messages.employers.registred')
      redirect_to admin_users_employers_path
    else
      render :new
    end
  end

  def update
    if @employer.update(edit_employer_params)
      flash[:notice] = t('messages.employers.updated')
      redirect_to admin_users_employers_path
    else
      render :edit
    end
  end

  def destroy
    @employer.destroy
    flash[:notice] = t('messages.employers.destroyed')
    redirect_to admin_users_employers_path
  end

  private

  def set_employer
    @employer = Employer.find(params[:id])
  end

  def employer_params
    params.require(:employer).permit(
      :email, :password, :password_confirmation, :name,
      info_attributes: %i[company_name]
    )
  end

  def edit_employer_params
    return employer_params.except(:password, :password_confirmation) if empty_password?
    employer_params
  end

  def empty_password?
    employer_params[:password].blank? || employer_params[:password_confirmation].blank?
  end

end
