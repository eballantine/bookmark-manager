require 'bookmark'

describe Bookmark do 
  describe '.all' do
    it 'returns saved bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")

      bookmark = Bookmark.all

      expect(bookmark).to include ['http://www.makersacademy.com', 'Makers']
      expect(bookmark).to include ['http://www.destroyallsoftware.com', 'Destroy']
      expect(bookmark).to include ['http://www.google.com', 'Google']
    end
  end

  describe '.add' do
    it 'adds a bookmark to saved bookmarks' do
      Bookmark.add("http://testing.com", "Test Title")
      expect(Bookmark.all).to contain_exactly(["http://testing.com", "Test Title"])
    end
  end
end
