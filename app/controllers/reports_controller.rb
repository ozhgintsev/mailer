class ReportsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  
  def index
    @reports = Report.recent
  end
  
  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(params[:report])
    @report.user = current_user
		respond_to do |format|
		  if @report.save
		    format.html  { redirect_to root_path }
		  else
		    format.html  { render :action => "new" }
		  end
		end    
  end
  
  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    respond_to do |format|
      if @report.update_attributes(params[:report])
        @report.status = 1
        @report.save
        NotificationsMailer.new_message(@report).deliver
        format.html { redirect_to reports_path }
      else
        format.html { render 'edit' }
      end
    end
  end
  
end
