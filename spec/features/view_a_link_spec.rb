# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
require 'spec_helper'

feature 'Viewing links on the homepage' do
  scenario 'The user can see a list of links when the homepage loads' do
    Link.create(url: 'http://www.google.co.uk', title: 'Google')
    visit '/'
    expect(page).to have_content('Google')
  end
end
