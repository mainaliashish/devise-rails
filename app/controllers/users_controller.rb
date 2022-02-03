class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
  end

  def index
    @users = User.order(created_at: :desc)
  end
end

