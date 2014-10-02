class CreateJobSeekers < ActiveRecord::Migration
  def up
    create_table :job_seekers do |t|

      t.string "first_name",:null => false,:limit=>50
      t.string "last_name", :null => false,:limit=>50
      t.string "user_id"
      t.string "phone_number"
      t.string "skills"
      t.text "resume"
      t.timestamps
    end
  end

def down 
	drop_table :job_seekers
end
end
