class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]

  # GET /job_applications
  # GET /job_applications.json
  def index
    @job_applications = JobApplication.all
  end



  def applicationsbyjobid
    @list = Jobapplication.where("job_id = ?",params[:id])
  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show
    if current_user.role == 2
      @jobs = Job.find_by_employers_id(Employer.find_by_user_id(current_user.id).id)
    elsif current_user.role == 1
      JobApplication.find_by_job_seeker_id(current_user.id)
      end
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
    flash[:job_id] = params["format"]
  end

  # GET /job_applications/1/edit
  def edit
  end


  def editstatus
    @list = Jobapplication.find(params[:id])
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.status = "pending review"
    @job_application.job_seeker_id = current_user.id
    @job = Job.find_by_id(@job_id)
    @job_application.job_id = flash[:job_id].to_i
    @job_application.application_deadline = Job.find_by_id(flash[:job_id].to_i).application_deadline
    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_application, notice: 'Job application was successfully created.' }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: 'Job application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def status
    job_application = JobApplication.find_by_id(params["id"])
    status = params["status"]
    puts status
    case status
      when 1.to_s
        status="Pending review"
      when 2.to_s
        status="Not a Fit"
      when 3.to_s
        status="Future Interview"
      else
        status="Pending review"


    end
    job_application.update_attribute("status",status)

    @job_applications = JobApplication.all
    render "index", notice: 'Job application was successfully updated.'
    end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application.delete
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_application_params
      params.require(:job_application).permit( :cover_letter, :application_deadline)
    end
end
