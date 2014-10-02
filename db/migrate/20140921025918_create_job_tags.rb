class CreateJobTags < ActiveRecord::Migration
  def up
    create_table :job_tags do |t|
    t.integer "job_id"
    t.integer "tag_id"    	
    t.timestamps
    end
  end
  def down
  
  	drop_table :job_tags
  end

end
