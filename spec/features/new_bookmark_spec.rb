require 'pg'
feature 'adding new bookmarks' do
  scenario 'A user can add favourite site to bookmark' do
    visit("/")
    click_button('go to add bookmarks')
    expect(page).to have_button 'enter'
  end
end

