class AdminUser < ActiveRecord::Base
  validates  :admin_name, :presence => true
  validates :email, :presence => true,:uniqueness => true
  validates :password, :presence => true

  attr_accessible :email,:password,:admin_name,:user_id
	has_many :categories
	has_many :employers, :through => :categories



end
