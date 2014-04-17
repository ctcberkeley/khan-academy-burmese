Feature: Send users reminder when deadline is approaching

  As a user
  So that I can remember to translate/digitize/qa a video that is assigned to me
  I want to be reminded that the deadline is approaching via email

Background: users and videos in database

  Given the following users exist:
  | name                     | email                  | password      | id |
  | user1                    | user1@example.com      | mypassword    | 1  |
  | user2                    | user2@example.com      | mypassword    | 2  |
  | user3                    | user3@example.com      | mypassword    | 3  |
  | admin                    | admin@example.com      | adminpassword | 4  |

  And the following videos with upcoming deadlines exist:
  | video_id     | subject  | course   | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete | due_date     |
  | To_Translate | SubjectA | CourseA  | TitleA | 4             |          |       | false              | false         | false       | 2001-1-1 |
  | To_Digitize  | SubjectB | CourseB  | TitleB | 2             | 4        |       | true               | false         | false       | 2001-1-1 |
  | To_Qa        | SubjectC | CourseC  | TitleC | 3             | 2        | 4     | true               | true          | false       | 2001-1-1 |

  And "admin@example.com" is an admin user
  When I am logged in with email: "admin@example.com" and password: "adminpassword"
  And I am on the dashboard page for "admin"
  And I follow "All users"

#TODO:test email sent
Scenario: send users email reminders
  And I follow "Email users with approaching deadlines"
  Then I should see "All users"