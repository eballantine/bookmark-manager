require 'bookmark'

describe Bookmark do 
  describe '.all' do
    it 'returns saved bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      add_test_bookmarks     
      bookmark = Bookmark.all

      expect([bookmark[0].url, bookmark[0].title]).to eq ['http://www.makersacademy.com', 'Makers']
      expect([bookmark[1].url, bookmark[1].title]).to eq ['http://www.destroyallsoftware.com', 'Destroy']
      expect([bookmark[2].url, bookmark[2].title]).to eq ['http://www.google.com', 'Google']
    end
  end

  describe '.add' do
    it 'adds a bookmark to saved bookmarks' do
      Bookmark.add("http://testing.com", "Test Title")
      expect(Bookmark.all.last.url).to eq "http://testing.com"
      expect(Bookmark.all.last.title).to eq "Test Title"
    end
  end
end
