class SchedulesController < ApplicationController
  def index
    @users = User.where("user_type_type = 'Doctor' && ban = false").order(:first_name)
  end

  def new
    @schedule = Schedule.new
    @user = User.where(id: params[:id]).first
  end

  def create
    raise
    #  Date.strptime(params[:Date][0..9], "%m/%d/%Y")
    #  Date.strptime(params[:Date][13..22], "%m/%d/%Y") 
  end

  def edit
    @schedules = Schedule.joins(:doctor => :user).where('users.ban = ? && users.id = ?',false,params[:id]).order('date ASC','shift ASC')
    @user = User.find(params[:id])
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
