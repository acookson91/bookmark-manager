feature 'Adding tags' do

  clean_it

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education'

    click_button 'Submit link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'I can add a multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.andrew.com/'
    fill_in 'title', with: 'Andrew'
    fill_in 'tags',  with: 'bubbles, comma'
    click_button 'Submit link'
    link = Link.last
    expect(link.tags.map(&:name)).to include('bubbles', 'comma')
  end


end
