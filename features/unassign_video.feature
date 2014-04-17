Feature: Unassign Video 
  As a user
  So that I can unassign a translate/digitize/qa video assigned to me
  I want to be able to unassign a video to me

Background: users and videos in database

  Given the following users exist:
  | name                     | email                  | password    | id |
  | Me                       | myemail@mydomain.com   | mypassword  | 1  |

  And the following videos exist:
  | video_id     | subject  | course   | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete |
  | To_Translate | SubjectA | CourseA  | TitleA |               |          |       | false              | false         | false       | 
  | To_Digitize  | SubjectB | CourseB  | TitleB | 2             |          |       | true               | false         | false       | 
  | To_Qa        | SubjectC | CourseC  | TitleC | 2             | 2        |       | true               | true          | false       | 

  And I am logged in with email: "myemail@mydomain.com" and password: "mypassword"
  And I am on the dashboard page for "Me"

Scenario: Translate View and Unassign Video
  When I follow "To_Translate_translate_button"
  When I follow "Translate"
  And I follow "the_translate_button"
  And I follow "Translate" 
  Then I should see "Video Details"
  And I should see "Video Status"
  When I follow "Unassign Me"
  Then I should see "You have been successfully unassigned"


Scenario: Digitize View
  When I follow "To_Digitize_digitize_button"
  When I follow "Digitize"
  And I follow "the_digitize_button"
  And I follow "Digitize" 
  Then I should see "Video Details"
  And I should see "Video Status"
  When I follow "Unassign Me"
  Then I should see "You have been successfully unassigned"



Scenario: QA View
  When I follow "To_Qa_qa_button"
  When I follow "QA"
  And I follow "the_qa_button"
  And I follow "QA" 
  Then I should see "Video Details"
  And I should see "Video Status"
  When I follow "Unassign Me"
  Then I should see "You have been successfully unassigned"

