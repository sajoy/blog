def login(user)
  visit '/'
  click_link 'Sign in and start writing'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Log In'
end
