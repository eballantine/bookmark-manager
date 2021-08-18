require 'pg'

class Bookmark
  def self.all
    connect_db
    @bookmarks = @connection.exec('SELECT * FROM bookmarks')
    @list = @bookmarks.map { |bookmark| bookmark['url'] }
  end

  def self.add(url)
    connect_db
    @connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

  private

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
