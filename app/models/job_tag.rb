class JobTag < ActiveRecord::Base
	belongs_to :creator, :class_name => "Job", :foreign_key => "job_id"
	belongs_to :creator, :class_name => "Tag", :foreign_key => "tag_id"
  attr_accessible :tag_id,:job_id
  #attr_reader :tag_id,:job_id
end
