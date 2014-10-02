require 'test_helper'

class JobSeekerTest < ActiveSupport::TestCase
  def test_jobseeker
    jobseeker = Jobseeker.new :first_name => jobseekers(:one).first_name,
                              :last_name => jobseekers(:one).last_name,
                              :phone_number => jobseekers(:one).phone_number,
                              :skills => jobseekers(:one).skills,
                              :resume => jobseekers(:one).resume

    assert jobseeker.save

    assert jobseeker.destroy
  end
end


t.string "first_name",:null => false,:limit=>50
t.string "last_name", :null => false,:limit=>50
t.string "user_id"
t.string "phone_number"
t.string "skills"
t.text "resume"
t.timestamps