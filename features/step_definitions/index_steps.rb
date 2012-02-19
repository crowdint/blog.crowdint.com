Given /^the following posts by "([^"]*)":$/ do |name, table|
  author = User.find_by_name name
  table.hashes.each_with_index do |hash, index|
    time_index = (index * 5)
    p = Post.create!(author: author, title: hash[:title], body: hash[:body],
                 published_at: time_index.minutes.ago)
    p.regenerate_permalink
    p.publish if hash[:published] == 'true'
    p.save!
  end
end

When /^I go to the index page$/ do
  visit root_path
end
