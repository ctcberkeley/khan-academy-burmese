Feature: Create an account

  As a new translator
  So that I can translate videos
  I want to create a new account


Scenario: Open a new account
  Given I am on the login page
  Then I should see "Sign Up"
  And  I should see "Sign In"
  When I fill in "First Name" with "Test"
  When I fill in "Last Name" with "User"
  And  I fill in "inputEmail" with "testemail@test.com"
  And  I fill in "createPassword" with "testpassword"
  And  I press "Sign Up"
  Then I should be on the dashboard page for "Test User"
  And I should see "Your account was successfully created"
