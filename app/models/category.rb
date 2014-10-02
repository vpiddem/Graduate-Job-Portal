class Category < ActiveRecord::Base
	
	belongs_to :creator, :class_name =>"AdminUser", :foreign_key => "admin_user_id"
	has_and_belongs_to_many :employers
	belongs_to :jobs
  attr_accessible :name

end
