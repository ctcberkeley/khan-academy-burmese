Feature: Digital Video Ready for QA
  As a user
  So that I can set a digized video ready for QA 
  I want to be able to set video ready for QA

Background: users and videos in database

  Given the following users exist:
  | name                     | email                  | password    | id |
  | Me                       | myemail@mydomain.com   | mypassword  | 1  |

  And the following videos exist:
  | video_id     | subject  | course   | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete | 
  | To_Digitize  | SubjectB | CourseB  | TitleA | 2             |          |       | true               | false         | false       | 


  And I am logged in with email: "myemail@mydomain.com" and password: "mypassword"
  And I am on the dashboard page for "Me"

Scenario: Set Digitized Video Ready to QA 
  When I follow "To_Digitize_digitize_button"
  When I follow "Digitize"
  And I follow "the_digitize_button"
  And I follow "Digitize" 
  Then I should see "Video Details"
  And I should see "Video Status"
  When I follow "Ready for QA"
  Then I should see "TitleA is now ready to be QAed."
  




