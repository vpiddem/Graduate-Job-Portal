class Employer < ActiveRecord::Base
	belongs_to :admin, :class_name =>"AdminUser", :foreign_key => "admin_user_id"
	has_many :tags
	has_many :jobs

  attr_accessible :company_name

  validates :admin_id, :presence => true
 
end
