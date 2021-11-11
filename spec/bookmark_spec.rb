

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      

      connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all
      
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.twitter.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end
  describe '.create' do
    it 'allows the user to create a new bookmark' do
      Bookmark.create(url: 'http://www.facebook.com')
      expect(Bookmark.all).to include 'http://www.facebook.com'
    end
  end
end
