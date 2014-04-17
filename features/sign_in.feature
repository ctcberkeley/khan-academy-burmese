Feature: Sign in to an account

  As a user
  So that I can view my account details
  I want to sign in to my account

Background: users in database

  Given the following users exist:
  | name                     | email                  | password    |
  | Me                       | myemail@mydomain.com   | mypassword  |

  And I am on the login page

# happy path
Scenario: log in to an account
  Then I should see "Sign In"
  When  I fill in "inputUsername" with "myemail@mydomain.com"
  And  I fill in "loginPassword" with "mypassword"
  And  I press "Sign In"
  Then I should be on the dashboard page for "Me"
  And I should see "To Translate"

# sad path
Scenario: try to log in with incorrect password
  Then I should see "Sign In"
  When  I fill in "inputUsername" with "myemail@mydomain.com"
  And  I fill in "loginPassword" with "wrongpassword"
  And  I press "Sign In"
  Then I should be on the login page
  And I should see "Please try again"


