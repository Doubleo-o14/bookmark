# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  set :environment, :production

  get '/' do
    'Bookmark Manager'
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb :'index'
  end

  get '/add_bookmarks' do
    erb :add_bookmarks
  end

  post '/add' do
    redirect '/'
  end
    

  run! if app_file == $PROGRAM_NAME
end
