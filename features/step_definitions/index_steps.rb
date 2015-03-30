Given /^the following posts by "([^"]*)":$/ do |name, table|
  author = User.find_by_name name
  table.hashes.each_with_index do |hash, index|
    time_index = (index * 5)
    state = hash[:state] ? hash[:state] : 'drafted'
    p = Post.create!(title: hash[:title], body: hash[:body], author: author, state: state)
    p.regenerate_permalink
    p.save!
    p.publish_as_publisher if hash[:published] == 'true'
    p.update_attribute(:published_at, time_index.days.ago) if hash[:published] == true
  end
end

When /^I go to the index page$/ do
  visit root_path
end

When /^I go to the "([^"]*)" posts page$/ do |author_name|
  author = User.where(:name => author_name).first
  visit posts_by_author_path(author)
end
