require 'test_helper'

class EmployerTest < ActiveSupport::TestCase
  def test_employer
    employer = Employer.new   :company_name => admins(:one).company_name,
                                :admin_id => admins(:one).admin_id,
                                :user_id => admins(:one).user_id,

                                assert employer.save
    assert employer.destroy
  end
end
