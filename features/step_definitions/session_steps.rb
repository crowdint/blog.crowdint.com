include Devise::TestHelpers

Given /^I am signed in as "([^"]*)"$/ do |email|
  @current_user = User.find_or_create_by_email(email)
  @current_user.reset_authentication_token!
  visit '/admin?auth_token=' + @current_user.authentication_token
end

Given /^An author with name "([^"]*)" and email "([^"]*)"$/ do |name, email|
  User.create!(name: name, email: email)
end

Given /^current user is publisher$/ do
  @current_user.update_attribute(:is_publisher, true)
end

