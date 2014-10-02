class JobSeeker < ActiveRecord::Base

has_many :job_applications
  validates :first_name, :presence => true,:format=> { with: /\A[a-zA-Z\s]*\z/, on: :create }
  validates :last_name, :presence => true,:format=> { with: /\A[a-zA-Z\s]*\z/, on: :create }
  #validates :email, :presence => true,:format=> { with: /\A([^@\s]+)@((?:[a-zA-Z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  #validates :password, :presence => true, :length => {minimum: 8}
  validates :resume, :presence => true

	scope :sorted, lambda{order("job_seekers.name_first ASC")}
	scope :newest_first, lambda{order("job_seekers.created_at DESC")}
	scope :search, lambda{|query|
		where(["name_first LIKE ?","%#{query}%"])
}

end
