require 'httparty'

class GoogleBooks
  BASE_URL = "https://www.googleapis.com/books/v1/volumes"

  def self.search(query, search)
    url = BASE_URL + "?q=#{search}#{query}"
    response = HTTParty.get(url)
    books = []

    if response["items"]
      response["items"].each do |item|
        title = item["volumeInfo"]["title"]
        authors = item["volumeInfo"]["authors"]
        publisher = item["volumeInfo"]["publisher"]
        link = item["volumeInfo"]["infoLink"]
        if item["volumeInfo"]["imageLinks"]
          image = item["volumeInfo"]["imageLinks"]["thumbnail"]
        end

        books << Book.new(title, authors, publisher, image, link)
      end
    else
      return nil
    end
    
    return books
  end
end
