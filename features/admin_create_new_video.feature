Feature: Admin can add new videos to app

  As an admin
  So that I can add new Khan Academy videos to the database
  I want to have a form to add videos to the app

Background: admin user in database

  Given the following users exist:
  | name                     | email                  | password      |
  | admin                    | admin@example.com      | adminpassword |

  Given "admin@example.com" is an admin user
  When I am logged in with email: "admin@example.com" and password: "adminpassword"
  
# Happy path
Scenario: Add new video to the database
  When I follow "Add video"
  Then I should see "Add new video"
  #Fill in form
  When I fill in "video_subject" with "test subject"
  And I fill in "video_course" with "test course"
  And I fill in "video_title" with "test title"
  And I fill in "video_video_id" with "testID"
  #Submit form
  When I press "Create Video"
  Then I should see "Video added successfully"
  And I should be on the videos index page
  And I should see "test subject"
  And I should see "test course"
  And I should see "test title"
