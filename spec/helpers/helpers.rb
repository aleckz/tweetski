  def register(username: 'katsuraku',
               name: 'bla',
               email: 'test@test.com',
               password: 'oranges')
    visit '/users/new'
    fill_in :username, with: username
    fill_in :name,     with: name
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end