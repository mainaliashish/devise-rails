class HomeController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource

  # def current_ability
  #   @current_ability ||= UserAbility.new(current_user)
  # end

  # def homepage; end

  def dashboard
    @user = User.find_by_id(params[:id])
  end
end
