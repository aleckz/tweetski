# feature 'Likes' do
#
#   scenario 'User can add a like to a peep' do
#     Peep.create(title: 'PEEP CITY!', message: 'yoyoyo')
#     visit '/peeps'
#     click_button('Like')
#     peep = Peep.first
#     expect(peep.likes).to include 1
#   end
#
# end
