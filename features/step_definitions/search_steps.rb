When /^I do a search$/ do
  within '.search' do
    fill_in 'q[text]', with: 'sailor'
    click_button 'Search'
  end
end
