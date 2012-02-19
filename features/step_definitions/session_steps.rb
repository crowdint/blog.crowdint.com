include Devise::TestHelpers

Given /^I am signed in as "([^"]*)"$/ do |email|
  @current_user = User.create!(email: email)
  @current_user.reset_authentication_token!
  visit '/admin?auth_token=' + @current_user.authentication_token
end

Given /^An author with name "([^"]*)" and email "([^"]*)"$/ do |name, email|
  User.create!(name: name, email: email)
end
