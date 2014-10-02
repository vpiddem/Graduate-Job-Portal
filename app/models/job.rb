class Job < ActiveRecord::Base

  belongs_to :employer
  belongs_to :category

  has_many :job_applications
  has_many :tags, :class_name => 'Job'
  accepts_nested_attributes_for :tags, :allow_destroy => true
  attr_accessible :title,:description,:application_deadline, :category_id, :employer
  def self.search(search)
    if search
      # paginate :per_page => 5, :page => 1,
      # :conditions => ["title LIKE '%?' ",search,search], :order => 'title'
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end