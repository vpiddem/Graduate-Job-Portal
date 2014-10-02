class CreateJobs < ActiveRecord::Migration
  def up
    create_table :jobs do |t|
    t.string :title
    t.string :description
    t.datetime :application_deadline
    t.references :category
    t.references :employers
    t.timestamps
    end
  end
    def down
      drop_table :jobs
    end
  end
