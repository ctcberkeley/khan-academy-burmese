require File.dirname(__FILE__) + '/../../config/environment.rb'

Given /the following videos exist/ do |videos_table|
  videos_table.hashes.each do |video|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that video to the database here.
    v = Video.create(video)
    v.update_attributes(
      :due_date => Date.parse('01-01-1970')
    )
  end

end

Given /the following videos with upcoming deadlines exist/ do |videos_table|
  videos_table.hashes.each do |video|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that video to the database here.
    v = Video.create(video)
    v.update_attributes(
      :due_date => 3.days.from_now
    )
  end

end

When /I upload a file with 4 video links/ do
    attach_file(:videos, File.join(Rails.root, 'features', 'upload-files', 'videos_csv.csv'))
    click_button "Upload"
end
