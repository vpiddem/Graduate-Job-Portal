class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
      t.string "admin_name",:null => false
      t.string "email" ,:default => "", :null => false
      t.string "password" ,:null => false,:limit => 50
      t.string "user_id" ,:null => false
      t.timestamps
    end
    admin = AdminUser.new
    admin.email = "admin@ncsu.edu"
    admin.password = "password"
    admin.user_id = "1"
    admin.admin_name = "admin"
    admin.save
  end


  def down
  	drop_table :admin_users
  end
end
