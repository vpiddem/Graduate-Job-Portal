class EmployersController < ApplicationController
before_action :set_employer, only: [:show, :edit, :update, :destroy]


  def index
    @employers = Employer.all
  end

  def show
  end

  def new
    @employer = Employer.new
  end

  def edit
  end


  def create
    @employer = Employer.new(employer_params)

    respond_to do |format|
      @employer.admin_id = current_user.id
      if User.find_by_email(params["email"])
        @employer.errors.add(:email, "Already in use")
        format.html { render action: 'new' }
        format.json { render json: @employer.errors }

      else
      user = User.new
      #user.password = User.new(password: @admin_user.password).encrypted_password
      user.password = params["password"]
      user.email = params["email"]
      user.role = 2
      user.save
      @employer.user_id = user.id
      if @employer.save

        format.html { redirect_to @employer, notice: 'Employer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employer }
      else
        format.html { render action: 'new' }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
    end
    end

  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to @employer, notice: 'Employer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @employer.delete
    respond_to do |format|
      format.html { redirect_to employers_url }
      format.json { head :no_content }
    end
  end

  private
    def set_employer
      @employer = Employer.find(params[:id])
    end

    def employer_params
      params.require(:employer).permit(:company_name)
    end
end
  