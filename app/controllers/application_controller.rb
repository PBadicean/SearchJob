class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    [resource.role, :root]
  end

  private

  def authorization_user!(role)
    return if current_user.send "#{role}?"
    msg = t :access_denied, scope: [:messages]
    return raise StandardError, msg if current_user.role.blank?
    redirect_to [current_user.role, :root], alert: msg
  end

end
