# lib/googlebooks_api_wrapper.rb

class BooksApiWrapper

  def self.search(query, search, api)
    api.search(query, search)
  end

end
