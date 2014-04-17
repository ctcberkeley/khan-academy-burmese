Feature: Complete Video Actions

  As a user
  So that I can translate/digitize/qa a video
  I want to be able to see translate/digitize/qa video details

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

Scenario: 
  When I follow "To_Translate_translate_button"
  When I follow "Translate"
  And I follow "the_translate_button"
  And I follow "Translate" 
  Then I should see "Video Details"
  And I should see "Video Status"
  When I follow "Handwritten Translation"
  Then I should see "Upload Handwritten Translation"
  And I should see "Ready for Digitization"

Scenario: 
  When I follow "To_Digitize_digitize_button"
  When I follow "Digitize"
  And I follow "the_digitize_button"
  And I follow "Digitize" 
  Then I should see "Video Details"
  And I should see "Video Status"
  And I should see "Ready for QA"


Scenario: 
  When I follow "To_Qa_qa_button"
  When I follow "QA"
  And I follow "the_qa_button"
  And I follow "QA" 
  Then I should see "Video Details"
  And I should see "Video Status"
  Then I should see "QA Complete"

