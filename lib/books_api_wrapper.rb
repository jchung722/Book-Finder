# lib/googlebooks_api_wrapper.rb

class BooksApiWrapper
  attr_reader :api

  def initialize(api)
    @api = api
  end

  def search(query, search)
    api.search(query, search)
  end

end
