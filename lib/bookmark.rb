require 'pg'

class Bookmark
  def self.all
    connect_db
    @bookmarks = @connection.exec('SELECT * FROM bookmarks')
    @list = @bookmarks.map { |bookmark| [bookmark['url'], bookmark['title']] }
  end

  def self.add(url, title)
    connect_db
    @connection.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2);", [url, title])
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
