feature 'User browses the list of links' do

  before(:each) do
    Peep.create(title: 'Peep Town',
                message: 'Yo this place is poppin',
                tags: [Tag.first_or_create(name: 'poppin')])
    Peep.create(title: 'Peep Village',
                message: 'Yo this place is not so poppin',
                tags: [Tag.first_or_create(name: 'lesspoppin')])
    Peep.create(title: 'Peep Hamlet',
                message: 'Yo where are we?',
                tags: [Tag.first_or_create(name: 'lost')])
    Peep.create(title: 'Peepless',
                message: 'Where are you guys?',
                tags: [Tag.first_or_create(name: 'lost')])
    end

  scenario 'User can filter peeps by tag' do
    visit '/tags/lost'
      expect(page).not_to have_content('Peep Town')
      expect(page).not_to have_content('Peep Village')
      expect(page).to have_content('Peep Hamlet')
      expect(page).to have_content('Where are you guys?')
  end


  scenario 'when visiting the homepage, can see peeps' do
    Peep.create(title: 'PEEP CITY!', message: 'yoyoyo')
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('yoyoyo')
  end
end
