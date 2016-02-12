def sign_up
  visit '/users/signup'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Register'
end
