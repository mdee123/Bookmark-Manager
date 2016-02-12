require 'spec_helper'

feature 'Viewing links' do
  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  # As a time-pressed user
  # So that I can quickly go to web sites I regularly visit
  # I would like to see a list of links on the homepage
  scenario 'The user can see a list of links' do
    visit '/links'
    expect(page).to have_content('Google')
  end

  # As a time-pressed user
  # So that I can quickly find links on a particular topic
  # I would like to filter links by tag
  scenario 'filter a link by tag' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
