class JobsController < ApplicationController


  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    @recommended_job_ids = Array.new
    if current_user.role == 1
      @jobs_applications = JobApplication.where(job_seeker_id: JobSeeker.find_by_user_id(current_user.id.to_s))
      @jobs_applied_ids = Array.new
      @jobs_applications.each { |ja| @jobs_applied_ids<< ja.job_id }
      @jobs_applied_ids.each do |job|
        @job_tag = JobTag.where(job_id: job)

        puts @job_tag

        @jobtag = JobTag.where(tag_id: @job_tag.each { |j| j.tag_id })

        @jobtag.each do |jt|
          @recommended_job_ids << jt.job_id
        end
      end
      @recommended_job_ids = @recommended_job_ids.uniq
    end

    @recommended_jobs=Job.where(id: @recommended_job_ids)
    puts '________________________________________________'
    puts @recommended_jobs

  end



  def jobsbyemployer
    @jobs = Job.where("employers_id = ?", Employer.find_by_user_id(current_user_id))
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    q = "%#{params[:search]}%"
    @jobs = Job.where("lower(title) like ? or lower(description) like ? ", q.downcase, q.downcase)
    render "index"
  end

  def new
    @categories = Category.all
    puts @categories
    @job = Job.new
    @tag = Tag.new

  end

  def edit
  end


  def create
    @job = Job.new(job_params)
    @result = params["tag_value"].split(" ")
    respond_to do |format|

      @job.employers_id = Employer.find_by_user_id(current_user.id).id

      @job.save
      var_job_id = @job.id
      if var_job_id
        @result.each { |x|
          tag = Tag.find_by_tag_value(x)
          if tag
            tag_id =tag.id
          else
            tag = Tag.new(:tag_value => x)
            tag.save
            tag_id = tag.id
          end
          job_tags =  JobTag.new
          job_tags.tag_id =  tag_id
          job_tags.job_id =  var_job_id
          job_tags.save
        }
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @job.delete
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :application_deadline, :category_id, :tags_id, :employers_id)
    end
end
