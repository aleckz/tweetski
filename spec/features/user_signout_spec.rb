feature 'User signs out' do

  before(:each) do
    User.create(username: 'katsuraku',
                name: 'name',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  def sign_in(username:, password:)
   visit '/sessions/new'
   fill_in :username, with: username
   fill_in :password, with: password
  end

  scenario 'while being signed in' do
    sign_in(username: 'katsuraku', password: 'test')
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!') # where does this message go?
    expect(page).not_to have_content('Welcome, katsuraku')
  end

  

end