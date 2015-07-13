feature 'TAGS' do
  
  # before(:each) do
  #   Peep.create(title: )

  # end


  scenario 'user can add tag(s) to peep' do
    visit '/peeps/new'
    fill_in 'title', with: 'Katsuraku'
    fill_in 'message', with: 'KAATTTSUUUUURAKU'
    fill_in 'tags', with: 'katsuraku japan'
    click_button('Peep!')
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include 'katsuraku', 'japan'
  end



end
