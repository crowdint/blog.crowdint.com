When /^I do a search$/ do
  within '.search' do
    fill_in 'q', with: 'sailor'
    click_button 'Search'
  end
end
