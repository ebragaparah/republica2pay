class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to republica_path(current_user.republica) if current_user.republica
    end
  end
end
