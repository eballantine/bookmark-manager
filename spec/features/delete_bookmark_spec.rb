feature 'Delete bookmark' do
  scenario 'user deletes bookmark' do
    visit '/'
    click_button('Add bookmark')
    fill_in 'url', with: 'http://www.testing.com'
    fill_in 'title', with: 'Test Title'
    click_button('Add')
    click_button('Delete bookmark')
    click_button('Delete')
    expect(page).to_not have_content('Test Title')
  end
end
