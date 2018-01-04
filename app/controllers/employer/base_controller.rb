class Employer::BaseController < ApplicationController

  before_action :authorization_employer!

  private

  def authorization_employer!
    authorization_user! :employer
  end

end
