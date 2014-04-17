Feature: Upload handwritten translations

  As a user
  So that I can translate a video without typing it on the computer
  I want to upload a scanned written translation

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

Scenario: upload a handwritten translation
  When I follow "To_Translate_translate_button"
  Then I should not see "TitleA"
  When I follow "Translate"
  Then I should see "TitleA"
  When I follow "Translate"
  When I follow "Handwritten Translation"
  When I press "upload_handwritten_translation"
  Then I should see "Video updated successfully"