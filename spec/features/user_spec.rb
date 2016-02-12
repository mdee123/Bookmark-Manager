require 'web_helper'

feature 'add a user account' do
  scenario 'user can sign up' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  def sign2
    visit '/users/signup'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'alice@example.com'
    fill_in :password, with: 'oranges!'
    fill_in :password_confirmation, with: 'apples'
    click_button 'Register'
  end

  scenario 'user signs up with mismatching password' do
    sign2
    expect {sign2}.not_to change(User, :count)
    expect(current_path).to eq('/users/signup')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
