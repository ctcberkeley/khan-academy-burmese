Feature: Admin edits an existing video details

  As an admin
  So that I can edit existing videos in the database
  I want to have a form to edit videos

Background: Admin user and video in database

  Given the following users exist:
    | name                     | email                  | password      |
    | admin                    | admin@example.com      | adminpassword |

  And the following videos exist:
  | video_id | subject  | course  | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete |
  | video_A  | SubjectA | CourseA | TitleA |               |          |       | false              | false         | false       | 
  | video_B  | SubjectB | CourseB | TitleB |               |          |       | false              | false         | false       |

  Given "admin@example.com" is an admin user
  When I am logged in with email: "admin@example.com" and password: "adminpassword"
  And I follow "All videos"

# Happy path
Scenario: Edit an existing video
  Then I should see "All videos"
  And I should see "SubjectA"
  And I should see "CourseA"
  And I should see "TitleA"
  When I follow "1_edit"
  Then I should see "Edit video"
  #Change video details
  When I fill in "video_subject" with "new subject"
  And I fill in "video_course" with "new course"
  And I fill in "video_title" with "new title"
  When I press "Save Changes"
  Then I should see "Video updated successfully"
  And I should be on the videos index page
  And I should see "new subject"
  And I should see "new course"
  And I should see "new title"
  And I should not see "SubjectA"
  And I should not see "CourseA"
  And I should not see "TitleA"



Scenario: Delete a video
  Then I should see "All videos"
  And I should see "SubjectB"
  And I should see "CourseB"
  And I should see "TitleB"
  When I follow "2_delete"
  Then I should see "Video deleted successfully"
  And I should be on the videos index page
  And I should not see "SubjectB"
  And I should not see "CourseB"
  And I should not see "TitleB"