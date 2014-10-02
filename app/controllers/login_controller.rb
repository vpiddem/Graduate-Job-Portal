class LoginController < ApplicationController
  before_action :authenticate_user!
  def login

  end
end
