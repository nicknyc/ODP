class SchedulesController < ApplicationController
  def index
    @users = User.where("user_type_type = 'Doctor' && ban = false").order(:first_name)
  end

  def new
  end

  def edit
    @schedules = Schedule.joins(:doctor => :user).where('users.ban = ? && users.id = ?',false,params[:id]).order('date ASC','shift ASC')
  end

  def show
    @schedules = Schedule.joins(:doctor => :user).where('users.ban = ? && users.id = ?',false,params[:id]).order('date ASC','shift ASC')
  end

  def destroy

  end

  def remove_schedule
    Schedule.find(params[:id]).delete
    respond_to do |format|
        format.json { head :no_content }
    end
  end

end
