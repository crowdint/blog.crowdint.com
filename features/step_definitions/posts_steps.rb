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

Then /^the post "([^"]*)" should have "([^"]*)" as its permalink$/ do |post_title, permalink|
  post = Post.find_by_title(post_title)
  post.permalink.should == permalink
end

Then /^the post titled "([^"]*)" is marked as published$/ do |post_title|
  @current_post = Post.find_by_title(post_title)
  @current_post.should be_published
end

Then /^current user is set as its publisher$/ do
  @current_post.publisher.should == @current_user
end

Then /^the post titled "([^"]*)" is marked as drafted$/ do |post_title|
  @current_post = Post.find_by_title(post_title)
  @current_post.should be_drafted
end
