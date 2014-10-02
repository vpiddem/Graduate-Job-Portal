require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def test_job
    job = job.new :title => jobs(:one).title,
                  :description => jobs(:one).description,
                  :application_deadline => jobs(:one).application_deadline,

    assert job.save

    assert job.destroy
  end
end