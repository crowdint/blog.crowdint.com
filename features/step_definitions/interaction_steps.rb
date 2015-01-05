Given /^I click on "([^"]*)"$/ do |link_name|
  click_link link_name, match: :first
end

Given /^I press "([^"]*)"$/ do |button_name|
  click_button button_name
end

Then /^I should see "([^"]*)"$/ do |expectation|
  page.should have_content expectation
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
  binding.pry
  table.raw.flatten.each do |expected|
    binding.pry
    page.should have_content expected
  end
end
