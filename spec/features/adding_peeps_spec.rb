feature 'User adds a new peep' do


  scenario 'User can create a new peep' do
    visit '/peeps/new'
    fill_in 'title', with: 'Lunch'
    fill_in 'message', with: 'Where shall we go today?'
    click_button('Peep!')
    expect(page).to have_content('Lunch')
  end

end
