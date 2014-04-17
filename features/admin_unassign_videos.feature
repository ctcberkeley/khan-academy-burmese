Feature: Admin can unassign videos from users

  As an admin user
  So that I unassign videos to other users
  I want to have a view where I can unassign videos to others

Background: users in database

  Given the following users exist:
  | name         | email                  | password      |
  | user1        | user1@example.com      | mypassword    |
  | user2        | user2@example.com      | mypassword    |
  | user3        | user3@example.com      | mypassword    |
  | admin        | admin@example.com      | adminpassword |

  And the following videos exist:
  | video_id | subject  | course  | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete |
  | video_A  | SubjectA | CourseA | TitleA | 1             |          |       | false              | false         | false       | 
  | video_B  | SubjectB | CourseB | TitleB | 5             | 2        |       | true               | false         | false       | 
  | video_C  | SubjectC | CourseC | TitleC | 6             | 7        | 3     | true               | true          | false       | 

  Given "admin@example.com" is an admin user
  When I am logged in with email: "admin@example.com" and password: "adminpassword"
  And I am on the dashboard page for "admin"


Scenario: Unassign translator from video
  When I follow "Unassign videos"
  Then I should see "Assigned Translators"
  When I follow "video_A_unassign_translator"
  Then I should see "user1 has been successfully unassigned from translating"
  And I should not see "CourseA"
  And I should not see "TitleA"
  
Scenario: Unassign translator from video
  When I follow "Unassign videos"
  Then I should see "Assigned Typers"
  When I follow "video_B_unassign_typer"
  Then I should see "user2 has been successfully unassigned from typing"
  And I should not see "CourseB"
  And I should not see "TitleB"
  
Scenario: Unassign translator from video
  When I follow "Unassign videos"
  Then I should see "Assigned to QA"
  When I follow "video_C_unassign_qa"
  Then I should see "user3 has been successfully unassigned from QA"
  And I should not see "CourseC"
  And I should not see "TitleC"
  