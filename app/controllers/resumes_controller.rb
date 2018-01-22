class ResumesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @resumes = Resume.last(5)
  end

  def show
    @resume = Resume.find(params[:id])
  end

end
