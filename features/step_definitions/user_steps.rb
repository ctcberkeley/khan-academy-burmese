# Add a declarative step here for populating the DB with movies.
require 'uri'

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create(user)
  end
end

Given /I am logged in with email: "(.*)" and password: "(.*)"/ do |email, password|
  visit login_page_path
  fill_in('inputUsername', :with => email)
  fill_in('loginPassword', :with => password)
  click_button('Sign In')
end

Given /"(.*)" is an admin user/ do |email|
  User.find_by_email(email).toggle!(:admin)
end

Then /the user "(.*)" should not exist/ do |username|
  User.where(:name => username).should be_blank
end

Then /the user "(.*)" should exist/ do |username|
  User.where(:name => username).should_not be_blank
end


Then /the password for "(.*)" should be "(.*)"/ do |username, value|
  User.where(:name => username)[0].password.eql?(value)
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  body = page.body
  pos1 = body.index(e1)
  pos2 = body.index(e2)

  pos1.should < pos2
#  flunk "Unimplemented"
end
