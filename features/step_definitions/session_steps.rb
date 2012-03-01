include Devise::TestHelpers

Given /^I am signed in as "([^"]*)"$/ do |email|
  @current_user = User.create!(email: email)
  @current_user.reset_authentication_token!
  visit '/admin?auth_token=' + @current_user.authentication_token
end

Given /^An author with name "([^"]*)" and email "([^"]*)"$/ do |name, email|
  User.create!(name: name, email: email)
end

Given /^current user is publisher$/ do
  @current_user.update_attribute(:is_publisher, true)
end

Given /^(?:|I )(?:am in|go to) the admin page$/ do
  visit crowdblog_path
end

When /^(?:|I )Sign Out$/ do
  click_link 'Sign out'
end
