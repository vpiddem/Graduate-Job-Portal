class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
 # has_one :job_seeker
  attr_accessible :email,:first_name,:last_name, :password, :password_confirmation, :remember_me, :job_seeker_attributes
 # accepts_nested_attributes_for :job_seeker

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
