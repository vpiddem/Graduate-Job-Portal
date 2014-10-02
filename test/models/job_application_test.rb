require 'test_helper'

class JobApplicationTest < ActiveSupport::TestCase
  def test_jobapplication
    jobapplication = Jobapplication.new :application_deadline => jobapplications(:one).application_deadline,
                                        :cover_letter => jobapplications(:one).cover_letter,
                                        :status => jobapplications(:one).status,

    assert jobapplication.save

    assert jobapplication.destroy
  end
end
