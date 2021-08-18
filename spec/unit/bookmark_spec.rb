require 'bookmark'

describe Bookmark do 
  describe '.all' do
    it 'returns saved bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

      bookmark = Bookmark.all

      expect(bookmark).to include "http://www.makersacademy.com"
      expect(bookmark).to include "http://www.destroyallsoftware.com"
      expect(bookmark).to include "http://www.google.com"
    end
  end
end
