class HomeController < ApplicationController
  before_action :authenticate_user!, except: :homepage

  def homepage; end

  def dashboard
    @user = current_user
  end
end
