class VisitorsController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :if_signed_in

  def if_signed_in
    if user_signed_in?
      @jobs = Job.all
      render template: "jobs/index"
    end
  end


  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  def show
    q = "%#{params[:search]}%"
    @jobs = Job.where("lower(title) like ? or lower(description) like ? ", q.downcase, q.downcase)
    render "index"
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:title, :description, :application_deadline, :category_id, :tags_id, :employers_id)
  end
end
