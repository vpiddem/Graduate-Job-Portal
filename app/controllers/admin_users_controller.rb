class AdminUsersController < ApplicationController
 before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

 #before_action :authenticate_user!

  def index
    #authorize("1")
    @admin_users = AdminUser.all
  end

  def show
  end

  def new
    @admin_user = AdminUser.new
  end

  def edit
  end


  def create
    @admin_user = AdminUser.new(admin_user_params)
    respond_to do |format|
      if User.find_by_email(params["email"])
        @employer.errors.add(:email, "Already in use")
        format.html { render action: 'new' }
        format.json { render json: @admin_user.errors }

      else
      user = User.new
      #user.password = User.new(password: @admin_user.password).encrypted_password
      user.password = @admin_user.password
      user.email = @admin_user.email
      user.role = 3
      user.save

      @admin_user.user_id = user.id

      if @admin_user.save

        format.html { redirect_to @admin_user, notice: 'AdminUser was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
      end
      end
  end

  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: 'AdminUser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @admin_user.delete
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end


    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    def admin_user_params
      params.require(:admin_user).permit(:admin_name,:email,:password)
    end
end


