class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.references :admin_user
      t.string "name"
      t.integer "created_by"
      t.timestamps
    end
    add_index :categories, ["admin_user_id"]
  end

  def down
    drop table :categories
  end
end
