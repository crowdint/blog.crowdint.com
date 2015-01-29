['eCommerce',
 'Open Source',
 'Mobile Dev',
 'Spree',
 'UX/UI Design',
 'Community',
 'Javascript',
 'iOS'].each do |category|
   Category.find_or_create_by(name: category)
 end

Post.all.each do |post|
  post.categories = []
  post.categories << Category.find_by(name: 'Community')
end
