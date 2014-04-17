Feature: QA Video to Complete

  As a user
  So that I can assure a video is complete
  I want to be able assure the qaulity of a video translation

Background: users and videos in database

  Given the following users exist:
  | name                     | email                  | password    | id |
  | Me                       | myemail@mydomain.com   | mypassword  | 1  |

  And the following videos exist:
  | video_id     | subject  | course   | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete       | 
  | To_Qa        | SubjectC | CourseC  | TitleC | 2             | 2        |       | true               | true          | false       | 

  And I am logged in with email: "myemail@mydomain.com" and password: "mypassword"
  And I am on the dashboard page for "Me"

Scenario: QA View
  When I follow "To_Qa_qa_button"
  When I follow "QA"
  And I follow "the_qa_button"
  And I follow "QA" 
  Then I should see "Video Details"
  And I should see "Video Status"
  When I follow "QA Complete"
  Then I should see "TitleC is now completed."
