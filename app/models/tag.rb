class Tag < ActiveRecord::Base
	belongs_to :creator, :class_name => "Employer", :foreign_key => "employer_id"
  attr_accessible :tag_value
end
