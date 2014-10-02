class JobApplication < ActiveRecord::Base

  belongs_to :jobs
  belongs_to :job_seekers
  validates :job_id,  presence: true
  validates :job_seeker_id, presence: true
  validates :status, :presence => true

  attr_accessible :cover_letter,:application_deadline

# <!-- Assigning Integer Values to various Job Application states - Using the standard Naming convention for Constants -->
  STATE_PENDING = 0
  STATE_FUTUREINTERVIEW = 1
  STATE_NOTAFIT = 2

  STATE_PENDING_STRING = 'Pending'
  STATE_FUTUREINTERVIEW_STRING = 'Future interview'
  STATE_NOTAFIT_STRING = 'Not a fit'

  def getApplicationState
    case self.status
      when STATE_FUTUREINTERVIEW
        return STATE_FUTUREINTERVIEW_STRING
      when STATE_PENDING
        return STATE_PENDING_STRING
      when STATE_NOTAFIT
        return STATE_NOTAFIT_STRING
      else
        return 'Pending review'
    end
  end

end
