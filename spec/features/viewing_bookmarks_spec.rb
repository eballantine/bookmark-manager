feature 'Viewing bookmarks' do
  scenario 'Shows a list of saved bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    add_test_bookmarks
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
