FactoryGirl.define do
  factory :post do
    title 'This is a post'
    body 'This is the body from the post'
    permalink 't'
    published_at '2014-12-15'
    author_id 1
    state 'published'
    publisher_id 1
    category_id 1
  end
end
