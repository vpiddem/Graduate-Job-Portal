class CreateEmployers < ActiveRecord::Migration
  def up
    create_table :employers do |t|

      t.string "company_name"
      t.integer "admin_id"
      t.integer "user_id"
      t.timestamps
    end

  end
  
  def down
      drop_table :employers
  end

end
