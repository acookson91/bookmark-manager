require 'database_cleaner'

feature 'creating links' do

  clean_it

  scenario 'user can create a new link' do
    visit('/')
    click_button('New Link')
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: 'http://www.makersacademy.co.uk'
    click_button('Submit link')
    expect(page).to have_content("Makers Academy")
  end
end
