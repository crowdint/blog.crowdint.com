Given /^I click on "([^"]*)"$/ do |link_name|
  #binding.pry
  click_link link_name, match: :first
end

When /^I select "([^"]*)"$/ do |option|
  select(option, from: 'category')
end

Given /^I press "([^"]*)"$/ do |button_name|
  click_button button_name
end

Then /^I should see "([^"]*)"$/ do |expectation|
  expect(page).to have_content(expectation)
end

When /^I click "([^"]*)" for "([^"]*)"$/ do |link_text, row_text|
  page.execute_script 'window.confirm = function() { return true }'
  find("tr:contains('#{row_text}')").find("a:contains('#{link_text}')").click
end

When /^I press "([^"]*)" for "([^"]*)"$/ do |link_text, row_text|
  page.execute_script 'window.confirm = function() { return true }'
  find("tr:contains('#{row_text}')").find("button:contains('#{link_text}')").click
end

Then /^I should not see "([^"]*)"$/ do |expectation|
  page.should_not have_content expectation
end

Then /^I should see:$/ do |table|
  table.raw.flatten.each do |expected|
    expect(page).to have_content(expected)
  end
end

Given /^I am in the main page$/ do
  visit root_path
end
