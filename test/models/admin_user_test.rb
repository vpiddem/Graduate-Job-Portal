require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  def test_admin
  adminuser = AdminUser.new   :email => admins(:one).email,
                          :password => admins(:one).password,
                          :admin_name => admins(:one).admin_name,
                         
  assert  adminuser.save
  assert adminuser.destroy
  end
  end

