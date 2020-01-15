class User::BaseController < ApplicationController
  before_action :ensure_user!

  def ensure_user!
    redirect_to root_path unless current_user
  end
end
