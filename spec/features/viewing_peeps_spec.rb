feature 'User browses the list of links' do
  

  scenario 'when visiting the homepage, can see peeps' do
    Peep.create(title: 'PEEP CITY!', message: 'yoyoyo')
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('yoyoyo')
  end
  
end