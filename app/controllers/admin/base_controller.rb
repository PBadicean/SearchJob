class Admin::BaseController < ApplicationController

  before_action :authorization_candidate!

  private

  def authorization_candidate!
    authorization_user! :admin
  end

end
