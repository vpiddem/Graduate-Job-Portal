require 'test_helper'

class JobTagTest < ActiveSupport::TestCase
  def test_jobtagtest


    t.integer "job_id"
    t.integer "tag_id"
    t.timestamps
    jobtags = JobTags.new :job_id => jobtags(:one).job_id,
                              :tag_id => jobtags(:one).tag_id,
    assert jobtags.save

    assert jobtags.destroy
  end
end