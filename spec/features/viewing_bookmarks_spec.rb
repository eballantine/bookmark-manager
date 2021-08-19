feature 'Viewing bookmarks' do
  scenario 'Shows a list of saved bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    add_test_bookmarks
    visit('/bookmarks')

    expect(page).to have_content 'Makers'
    expect(page).to have_content 'Destroy'
    expect(page).to have_content 'Google'
  end
end
