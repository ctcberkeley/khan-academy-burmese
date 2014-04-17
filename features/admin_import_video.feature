Feature: Admin can add new videos to app

  As an admin
  So that I can add new Khan Academy videos to the database
  I want to have a form to add videos to the app

Background: admin user in database

  Given the following users exist:
  | name                     | email                  | password      |
  | admin                    | admin@example.com      | adminpassword |

  Given "admin@example.com" is an admin user
  When I am logged in with email: "admin@example.com" and password: "adminpassword"
  
@javascript
Scenario: Add new video to the database
  When I follow "Admin"	  
  Then I follow "Import videos"
  And I upload a file with 4 video links
  Then I should see "Videos to be Imported"
