namespace :redistribute do
	
  desc "Unassign videos for which the deadline to submit has passed"
  task :unassign_overdue_videos => :environment do
    o = VideosController.new
    o.unassign_overdue_videos
  end

end
