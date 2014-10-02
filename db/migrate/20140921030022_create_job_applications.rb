class CreateJobApplications < ActiveRecord::Migration
  def up
    create_table :job_applications do |t|
      t.references :job
      t.references :job_seeker
    	t.integer "status" , default: 0
    	t.text "cover_letter"
      t.datetime "application_deadline"
      t.timestamps
    end
    add_index :job_applications, ["job_id","job_seeker_id"],:unique => true
    
    # add_index :people, [:firstname, :lastname, :dob], :unique => true
  end

  def down
  	drop_table :job_applications
  end

end
