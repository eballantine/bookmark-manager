feature 'Index page' do
  
  it "has a message" do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  it "has a button to go to bookmarks page" do
    visit('/')
    click_button("Bookmarks!")
    expect(page).not_to have_content 'Bookmark Manager'
    expect(page).to have_content 'Welcome to Bookmarks!'
  end
end
