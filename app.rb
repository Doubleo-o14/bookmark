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
    p ENV['ENVIRONMENT']
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add_bookmarks' do
    erb :add_bookmarks
  end

  post '/bookmarks' do
    # p params
    # p "Form data submitted to the /bookmarks route!"
    url = params['url']
    connection = PG.connect(dbname: 'bookmark_manager')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end
    
  # get '/bookmarks' do
  #   erb :index
  # end

  run! if app_file == $PROGRAM_NAME
end
