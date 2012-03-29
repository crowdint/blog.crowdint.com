Then /^(?:|I )should be Signed Out$/ do
  page.should have_content 'About Crowd Interactive'
end

Then /^(?:|I )should see the Sign in page$/ do
  page.should have_content 'Welcome to Crowd Interactive'
end
