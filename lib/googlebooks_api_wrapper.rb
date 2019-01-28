# lib/googlebooks_api_wrapper.rb
require 'httparty'

class BooksApiWrapper
  BASE_URL = "https://www.googleapis.com/books/v1/volumes"
  TOKEN = ENV["KEY"]

  def self.search(query)
    url = BASE_URL + "&q=#{query}"
    response = HTTParty.get(url)
    books = []

    if response["items"]
      response["items"].each do |item|
        title = item["volumeInfo"]["title"]
        authors = item["volumeInfo"]["authors"]
        publisher = item["volumeInfo"]["publisher"]
        image = item["volumeInfo"]["imageLinks"]["thumbnail"]
        link = item["volumeInfo"]["infoLink"]

        books << Book.new(title, authors, publisher, image, link)
    end
    else
      return nil
    end

    return books
  end

end
