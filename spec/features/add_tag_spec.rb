# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature 'tag links in my bookmark manager' do
  scenario 'add a tag to a link' do
    visit '/links/new'
    fill_in :url, with: 'bbc.co.uk'
    fill_in :title, with: 'bbc'
    fill_in :tags, with: 'news'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end

  scenario 'add multiple tags' do
    visit '/links/new'
    fill_in :url, with: 'bbc.co.uk'
    fill_in :title, with: 'bbc'
    fill_in :tags, with: 'news update'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news', 'update')
  end
end
