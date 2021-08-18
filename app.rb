require "sinatra"
require "sinatra/base"
require "sinatra/reloader" if development?
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end 
  
  get '/bookmarks' do
    @list = Bookmark.all
    erb :bookmarks
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    Bookmark.add(params[:url])
    redirect('/bookmarks')
  end
  
  run! if app_file == $0
end
