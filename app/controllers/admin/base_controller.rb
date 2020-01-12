class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user!

  def ensure_admin_user!
    redirect_to root_path unless current_user&.admin
  end
end
