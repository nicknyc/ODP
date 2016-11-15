class SchedulesController < ApplicationController
  def index
    @users = User.where("user_type_type = 'Doctor' && ban = false").order(:first_name)
  end

  def new
  end

  def edit
  end

  def show
  end
end
