Given /^the following posts by "([^"]*)":$/ do |name, table|
  author = User.find_by_name name
  table.hashes.each_with_index do |hash, index|
    time_index = (index * 5)
    p = Post.create!(title: hash[:title], body: hash[:body])
    p.author = author
    p.regenerate_permalink
    p.save!
    p.publish if hash[:published] == 'true'
    p.update_attribute(:published_at, time_index.days.ago)
  end
end

When /^I go to the index page$/ do
  visit root_path
end
