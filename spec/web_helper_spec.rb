def add_test_bookmarks
  Bookmark.add('http://www.makersacademy.com', 'Makers')
  Bookmark.add('http://www.destroyallsoftware.com', 'Destroy')
  Bookmark.add('http://www.google.com', 'Google')
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end