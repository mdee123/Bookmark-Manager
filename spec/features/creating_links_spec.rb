# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'add site\'s address and title to the bookmark manager' do
  scenario 'adding a link' do
    visit '/new'
    fill_in :url, with: 'bbc.co.uk'
    fill_in :title, with: 'bbc'
    click_button 'Submit'
    expect(page).to have_content 'bbc'
  end
end
