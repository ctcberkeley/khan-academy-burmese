Feature: Modify user account

  As a user
  So that I can update my account
  I want to make modifications to my account information

Background: users in database

  Given the following users exist:
  | name                     | email                  | password   |
  | Me                       | myemail@mydomain.com   | mypassword |

  When I am logged in with email: "myemail@mydomain.com" and password: "mypassword"
  And I am on the dashboard page for "Me"
  And I follow "Profile"

Scenario: View the current user's account
  Then I should see "Me"
  And  I should see "myemail@mydomain.com"

Scenario: Change name associated with account
  And  I press "Edit account information"
  Then I should be on the edit user page for "Me"
  And  I should see "Me"
  When I fill in "Name" with "My new name"
  And  I press "Update Account Info"
  Then I should be on the user page for "My new name"
  And  I should see "My new name"
  And  I should see "myemail@mydomain.com"

Scenario: Change the email associated with account
  And  I press "Edit account information"
  Then I should be on the edit user page for "Me"
  And  I should see "Me"
  When I fill in "Email" with "newemail@newdomain.com"
  And  I press "Update Account Info"
  Then I should be on the user page for "Me"
  And  I should see "Me"
  And  I should see "newemail@newdomain.com"

Scenario: Delete a user account
  And  I press "Delete account"
  Then I should be on the login page
  And  I should see "Your account was successfully deleted"
  And  the user "Me" should not exist

Scenario: Change the password associated with account
  And  I press "Edit account information"
  Then I should be on the edit user page for "Me"
  And  I follow "Change password"
  Then I should see "Change password"
  When I fill in "current" with "mypassword"
  And  I fill in "new" with "mynewpassword"
  And  I fill in "confirmation" with "mynewpassword"
  And  I press "Update password"
  Then I should be on the edit user page for "Me"
  And  I should see "Your password was updated"
  And  the password for "Me" should be "mynewpassword"

Scenario: Password confirmation does not match the new password
  And  I press "Edit account information"
  Then I should be on the edit user page for "Me"
  And  I follow "Change password"
  Then I should be on the change password page for "Me"
  And  I should see "Current password"
  And  I should see "New password"
  And  I should see "Confirm new password"
  When I fill in "current" with "mypassword"
  And  I fill in "new" with "mynewpassword"
  And  I fill in "confirmation" with "anewpassword"
  And  I press "Update password" 
  Then I should be on the change password page for "Me"
  And  I should see "Your confirmation did not match the new password you entered"

Scenario: Old password does not match current password
  And  I press "Edit account information"
  Then I should be on the edit user page for "Me"
  And  I follow "Change password"
  Then I should be on the change password page for "Me"
  And  I should see "Current password"
  And  I should see "New password"
  And  I should see "Confirm new password"
  When I fill in "current" with "badpassword"
  And  I fill in "new" with "mynewpassword"
  And  I fill in "confirmation" with "mynewpassword"
  And  I press "Update password" 
  Then I should be on the change password page for "Me"
  And  I should see "Incorrect current password"

  

#Scenario: Attempt to view another user's account (?)
