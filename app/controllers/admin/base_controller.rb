class Admin::BaseController < ApplicationController

  before_action :authorization_admin!

  private

  def authorization_admin!
    authorization_user! :admin
  end

end
