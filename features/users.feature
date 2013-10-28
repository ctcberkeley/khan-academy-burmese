Feature: Something something users something

  As a something
  So that I can something
  I want to something

Background: users in database

  Given the following users exist:
  | name                     | email                  | password   |
  | Me                       | myemail@mydomain.com   | mypassword |

Scenario: View the current user's account
  When I am on the user page for "Me"
  Then I should see "Me"
  And  I should see "myemail@mydomain.com"

Scenario: Add a new user account
  When I am on the login page
  Then the user "Test User" should not exist
  When I fill in "First Name" with "Test"
  When I fill in "Last Name" with "User"
  And  I fill in "Email" with "testemail@test.com"
  And  I fill in "Password" with "testpassword"
  And  I check "I agree to all your Terms of Service"
  And  I press "Sign Up"
  Then I should be on the user page for "Test User"
  And  I should see "testemail@test.com"
  And  I should see "Test User"
  And  the user "Test User" should exist

Scenario: Change name associated with account
  When I am on the user page for "Me"
  And  I press "Edit account information"
  Then I should be on the edit user page for "Me"
  And  I should see "Me"
  When I fill in "Name" with "My new name"
  And  I press "Update Account Info"
  Then I should be on the user page for "My new name"
  And  I should see "My new name"
  And  I should see "myemail@mydomain.com"

Scenario: Change the email associated with account
  When I am on the user page for "Me"
  And  I press "Edit account information"
  Then I should be on the edit user page for "Me"
  And  I should see "Me"
  When I fill in "Email" with "newemail@newdomain.com"
  And  I press "Update Account Info"
  Then I should be on the user page for "Me"
  And  I should see "Me"
  And  I should see "newemail@newdomain.com"

Scenario: Successfully change account password
  When I am on the edit user page for "Me"
  And  I press "Change password"
  Then I should be on the change password page for "Me"
  And  I should see "Current password"
  And  I should see "New password"
  And  I should see "Confirm new password"
  When I fill in "current" with "mypassword"
  And  I fill in "new" with "mynewpassword"
  And  I fill in "confirmation" with "mynewpassword"
  And  I press "Update password" 
  Then I should be on the edit user page for "Me"
  And  the "password" for "Me" should be "mynewpassword"
  And  I should see "Your password was updated"

Scenario: Password confirmation does not match the new password
  When I am on the edit user page for "Me"
  And  I press "Change password"
  Then I should be on the change password page for "Me"
  And  I should see "Current password"
  And  I should see "New password"
  And  I should see "Confirm new password"
  When I fill in "current" with "mypassword"
  And  I fill in "new" with "mynewpassword"
  And  I fill in "confirmation" with "anewpassword"
  And  I press "Update password" 
  Then I should be on the change password page for "Me"
  And  the "password" for "Me" should be "mypassword"
  And  I should see "Your confirmation did not match the new password you entered"

Scenario: Old password does not match current password
  When I am on the edit user page for "Me"
  And  I press "Change password"
  Then I should be on the change password page for "Me"
  And  I should see "Current password"
  And  I should see "New password"
  And  I should see "Confirm new password"
  When I fill in "current" with "mypassword"
  And  I fill in "new" with "mynewpassword"
  And  I fill in "confirmation" with "mynewpassword"
  And  I press "Update password" 
  Then I should be on the change password page for "Me"
  And  the "password" for "Me" should be "mypassword"
  And  I should see "Incorrect current password"

Scenario: Delete a user account
  When I am on the user page for "Me"
  And  I press "Delete account"
  Then I should be on the login page
  And  I should see "Your account was successfully deleted"
  And  the user "Me" should not exist



#Scenario: Attempt to view another user's account (?)