feature 'Add bookmark' do
  scenario 'from homepage, add bookmark, return to homepage' do
    visit '/'
    click_button('Add bookmark')
    expect(page).to have_content 'Add a bookmark'
    fill_in 'url', with: 'http://www.testing.com'
    fill_in 'title', with: 'Test Title'
    click_button('Add')
    visit('/bookmarks')
    expect(page).to have_content 'Test Title'
  end
end
