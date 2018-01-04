class Candidate::BaseController < ApplicationController

  before_action :authorization_candidate!

  private

  def authorization_candidate!
    authorization_user! :candidate
  end

end
