feature 'we can log in' do
  scenario 'from landing page we can go to the login page' do
    go_to_login_page
    expect(page).to have_content 'Welcome to Chitter'
  end

  # scenario 'fill out log in form with username and password' do
  #   login_and_visit_home
  #   expect(page).to have_content 'firstuser'
  # end
end

