Feature: Something something users something

  As a something
  So that I can something
  I want to something

Scenario: Failed Login

Given I am on the login page 
And I fill in "inputFirst" with "My_first_name"
And I fill in "inputLast" with "My_last_name"
And I fill in "inputEmail" with "adfadfadsfdsf"
And I fill in "createPassword" with "myPassword"
And I press "Sign Up"
Then I should see "Problem creating account. Please try again"

