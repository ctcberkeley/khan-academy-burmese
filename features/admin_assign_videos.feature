Feature: Admin can assign videos to be translated/digitized/QAed to other users

  As an admin user
  So that I assign videos to other users
  I want to have a view where I can assign videos to others

Background: users in database

  Given the following users exist:
  | name                     | email                  | password      |
  | user1                    | user1@example.com      | mypassword    |
  | user2                    | user2@example.com      | mypassword    |
  | user3                    | user3@example.com      | mypassword    |
  | admin                    | admin@example.com      | adminpassword |

  And the following videos exist:
  | video_id | subject  | course  | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete |
  | video_A  | SubjectA | CourseA | TitleA |               |          |       | false              | false         | false   | 
  | video_B  | SubjectB | CourseB | TitleB | 5             |          |       | true               | false         | false   | 
  | video_C  | SubjectC | CourseC | TitleC | 6             | 7        |       | true               | true          | false   | 

  Given "admin@example.com" is an admin user
  When I am logged in with email: "admin@example.com" and password: "adminpassword"
  And I am on the dashboard page for "admin"

Scenario: Assign a video to be translated to a user
  Then I should see "Admin Actions"
  When I follow "video_A_someone_else_translate_button"
  Then I should see "Assign video -"
  And I should see "user1 , user1@example.com"  
  And I should see "user2 , user2@example.com"
  And I should see "user3 , user3@example.com"
  When I follow "1_translate_video_A"
  Then I should see "Videos Available To Translate"
  And I should not see "video_A"

Scenario: Assign a video to be digitized to a user
  Then I should see "Admin Actions"
  When I follow "video_B_someone_else_type_button"
  Then I should see "Assign video -"
  And I should see "user1 , user1@example.com"  
  And I should see "user2 , user2@example.com"
  And I should see "user3 , user3@example.com"
  When I follow "2_type_video_B"
  Then I should see "Videos Available To Digitize"
  And I should not see "video_B"

Scenario: Assign a video to be QAed to a user
  Then I should see "Admin Actions"
  When I follow "video_C_someone_else_qa_button"
  Then I should see "Assign video -"
  And I should see "user1 , user1@example.com"  
  And I should see "user2 , user2@example.com"
  And I should see "user3 , user3@example.com"
  When I follow "3_qa_video_C"
  Then I should see "Videos Available To QA"
  And I should not see "video_C"