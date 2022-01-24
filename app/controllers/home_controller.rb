class HomeController < ApplicationController
  before_action :authenticate_user!, except: :homepage

  def homepage; end

  def dashboard
    @user = User.find_by_id(params[:id])
  end
end
