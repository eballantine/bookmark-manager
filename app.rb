require "sinatra"
require "sinatra/base"
require "sinatra/reloader" if development?
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override

  get '/' do
    @list = Bookmark.all
    erb :index
  end 
  
  get '/bookmarks' do
    @list = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  post '/bookmarks/add' do
    Bookmark.add(params[:url], params[:title])
    redirect('/')
  end

  get '/bookmarks/delete' do
    @list = Bookmark.all
    erb :'bookmarks/delete'
  end

  delete '/bookmarks/delete' do 
    Bookmark.delete(params[:id])
    redirect('/')
  end
  
  run! if app_file == $0
end
