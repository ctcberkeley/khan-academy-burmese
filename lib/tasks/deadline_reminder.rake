namespace :deadline_reminder do
	
  desc "Email users with an upcoming video deadline"
  task :email_deadline_reminder => :environment do
    o = VideosController.new
    o.send_deadline_approaching_reminders
  end

end
