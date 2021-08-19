require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end
  
  def self.all
    connect_db
    @bookmarks = @connection.exec('SELECT * FROM bookmarks')
    @list = @bookmarks.map { |bookmark| Bookmark.new(bookmark ['id'], bookmark['url'], bookmark['title'])}
  end

  def self.add(url, title)
    connect_db
    result = @connection.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, title, url;", [url, title])
    Bookmark.new(result[0]['id'], url, title)
  end

  def self.delete(id)
    connect_db
    @connection.exec_params("DELETE FROM bookmarks WHERE id=$1;", [id])
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
