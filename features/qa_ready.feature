Feature: Video Ready for QA/Digitization 
  As a user
  So that I can translate/digitize a video assigned to me
  I want to be able to set video ready for QA/Digitization

Background: users and videos in database

  Given the following users exist:
  | name                     | email                  | password    | id |
  | Me                       | myemail@mydomain.com   | mypassword  | 1  |

  And the following videos exist:
  | video_id     | subject  | course   | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete |
  | To_Translate | SubjectA | CourseA  | TitleA |               |          |       | false              | false         | false       | 


  And I am logged in with email: "myemail@mydomain.com" and password: "mypassword"
  And I am on the dashboard page for "Me"

Scenario: Set translate video ready to QA
  When I follow "To_Translate_translate_button"
  When I follow "Translate"
  And I follow "the_translate_button"
  And I follow "Translate" 
  Then I should see "Video Details"
  And I should see "Video Status"
  When I follow "Ready for QA"
  Then I should see "TitleA is now ready to be QAed."


Scenario: Set translate video ready for digitization
  When I follow "To_Translate_translate_button"
  When I follow "Translate"
  And I follow "the_translate_button"
  And I follow "Translate" 
  Then I should see "Video Details"
  And I should see "Video Status"
  And I should see "Handwritten Translation"
  When I follow "Handwritten Translation"
  And I follow "Ready for Digitization"
  Then I should see "TitleA is now ready to be digitized"



