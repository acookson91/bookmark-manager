feature 'adding a tag to a link' do
  scenario 'the newly created link appears on the links page' do
    visit '/links/new'
    fill_in(:title, with: "Facebook")
    fill_in(:url, with: "www.facebook.com")
    fill_in(:tag, with: "Social Media")
    click_button("Submit")
    visit '/links/tags'
    expect(page).to have_content("Social Media")
  end
end
