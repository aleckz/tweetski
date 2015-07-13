feature 'User Management' do

  scenario 'user can register' do
    user = build :user
    expect { register(user) }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, katsuraku')
    expect(User.first.username).to eq('katsuraku')
  end

  scenario 'matching confirmation password necessary' do
    user = build(:user, password_confirmation: 'notoranges')
    expect { register(user) }.not_to change(User, :count)
    expect(current_path).to eq ('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing username/email' do
    user = build :user
    register(user)
    expect { register(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

end