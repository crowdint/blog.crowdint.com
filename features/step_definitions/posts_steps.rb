Given /^I go to the posts page$/ do
  visit admin_posts_path
end

Given /^I fill "([^"]*)" as the post title$/ do |text|
  fill_in 'Title', with: text
end

Given /^I fill "([^"]*)" as the post body$/ do |text|
  fill_in 'Body', with: text
end

Then /^the post "([^"]*)" should be authored by current user$/ do |post_title|
  post = Post.find_by_title(post_title)
  post.author.should == @current_user
end
