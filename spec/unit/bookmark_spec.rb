require 'bookmark'

describe Bookmark do 
  describe '#self.all' do
    it 'returns saved bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      add_test_bookmarks     
      bookmark = Bookmark.all

      expect([bookmark[0].url, bookmark[0].title]).to eq ['http://www.makersacademy.com', 'Makers']
      expect([bookmark[1].url, bookmark[1].title]).to eq ['http://www.destroyallsoftware.com', 'Destroy']
      expect([bookmark[2].url, bookmark[2].title]).to eq ['http://www.google.com', 'Google']
    end
  end

  describe '#self.add' do
    it 'adds a bookmark to saved bookmarks' do
      bookmark = Bookmark.add("http://testing.com", "Test Title")
      expect(bookmark.id).to eq persisted_data(bookmark.id)['id']
      expect(bookmark.url).to eq "http://testing.com"
      expect(bookmark.title).to eq "Test Title"
    end
  end

  describe '#self.delete' do
    it 'deletes a bookmark from database' do
      add_test_bookmarks
      bookmark_ids = []
      Bookmark.all.each { |bookmark| bookmark_ids << bookmark.id }
      Bookmark.delete(1)
      expect(bookmark_ids).not_to include(1)
    end
  end
end
