feature 'User Management' do

  # def register(username: 'katsuraku',
  #              name: 'bla',
  #              email: 'test@test.com',
  #              password: 'oranges')
  #   visit '/users/new'
  #   expect(page.status_code).to eq(200)
  #   fill_in :email,    with: email
  #   fill_in :password, with: password
  #   click_button 'Sign up'
  # end

  scenario 'user can register' do
    expect { register }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, katsuraku')
    expect(User.first.username).to eq('katsuraku')
  end




end