Feature: Unassign Overdue Videos

  As a an admin
  So that users don't hold on to a video for too long
  I want to unassign all overdue videos at once

Background: users and videos in database

  Given the following users exist:
  | name                     | email                  | password      | id |
  | user1                    | user1@example.com      | mypassword    | 1  |
  | user2                    | user2@example.com      | mypassword    | 2  |
  | user3                    | user3@example.com      | mypassword    | 3  |
  | admin                    | admin@example.com      | adminpassword | 4  |

  And the following videos exist:
  | video_id     | subject  | course   | title  | translator_id | typer_id | qa_id | translate_complete | type_complete | qa_complete | due_date     |
  | To_Translate | SubjectA | CourseA  | TitleA | 4             |          |       | false              | false         | false       | 2001-1-1 |
  | To_Digitize  | SubjectB | CourseB  | TitleB | 2             | 4        |       | true               | false         | false       | 2001-1-1 |
  | To_Qa        | SubjectC | CourseC  | TitleC | 3             | 2        | 4     | true               | true          | false       | 2001-1-1 |

  And "admin@example.com" is an admin user
  When I am logged in with email: "admin@example.com" and password: "adminpassword"
  And I am on the dashboard page for "admin"
  And I follow "All users"


Scenario: unassign all overdue videos
  And I follow "Unassign All Overdue Videos"
  And I follow "Dashboard"
  Then I should see "Available3" 
