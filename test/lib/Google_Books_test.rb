require 'test_helper'

describe GoogleBooks do

  it "Can Retrieve a list of books based on query" do
    VCR.use_cassette("books") do
      books = GoogleBooks.search("Harry","")

      assert books.is_a? Array
      assert books.length == 10
      books.each do |book|
        assert book.is_a? Book
      end
    end
  end

  it "Retrieves nil when given the wrong search terms with no matching items" do
    VCR.use_cassette("bad-search-terms") do
      books = BooksApiWrapper.search("dlaksdjfas","inauthor:")

      assert books == nil
    end
  end
end
