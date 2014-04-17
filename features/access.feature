Feature: Protect user accounts from access by others

  As a user
  So that I can protect my privacy
  I want to prevent others from viewing and modifying my account

Background: users in database

  Given the following users exist:
  | name                     | email                      | password     |
  | Me                       | myemail@mydomain.com       | mypassword   |
  | You                      | youremail@yourdomain.com   | yourpassword |

Scenario: View another user's account
  When I am logged in with email: "myemail@mydomain.com" and password: "mypassword"
  And I am on the user page for "Me"
  Then I go to the user page for "You"
  Then I should see "You do not have permission to access that page"

Scenario: View account without being logged in
  When I go to the user page for "Me"
  Then I should see "You have to be logged in to view that page"