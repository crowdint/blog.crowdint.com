Then(/^I fill "(.*?)" as the category name$/) do |text|
  fill_in 'Name', with: text
end

Given(/^I have a category with the name "(.*?)"$/) do |name|
  Category.create name: name
end

Given(/^I go to the admin categories page$/) do
  visit admin_categories_path
end

Given(/^I am logged in as an admin user$/) do
  visit crowdblog.admin_root_path
end

When(/^I check "(.*?)" on the categories list$/) do |name|
  check(name)
end

Then(/^I should see "(.*?)" within "(.*?)"$/) do |text, scope|
  within(scope) do
    expect(page).to have_content(text)
  end
end

