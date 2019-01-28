# lib/googlebooks_api_wrapper.rb
require 'httparty'

class BooksApiWrapper
  BASE_URL = "https://www.googleapis.com/books/v1/volumes"
  TOKEN = ENV["KEY"]
end
