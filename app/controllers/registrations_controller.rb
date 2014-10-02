class RegistrationsController < Devise::RegistrationsController

  def create
    super

    # Creating a Job Seeker record after User creation
    js = JobSeeker.new

puts "----------------------------------"
    js.first_name= params["first_name"]
    js.last_name= params["last_name"]
    js.user_id= resource.id
    js.phone_number= params["phone_number"]
    js.skills= params["skills"]
    js.resume= params["resume"]
    puts js.save

    #JobSeeker.create(:first_name => "hii")

  end
end

