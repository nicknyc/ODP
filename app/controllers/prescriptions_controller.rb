class PrescriptionsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def remove_med
    Prescription.find(params[:id]).delete
    respond_to do |format|
        format.json { head :no_content }
    end
  end

end
