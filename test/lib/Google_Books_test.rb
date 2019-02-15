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

  it "Can Retrieve a list of books based on a query and search term" do
    VCR.use_cassette("books-with-search-terms") do
      books = GoogleBooks.search("Harry","inauthor:")

      assert books.is_a? Array
      assert books.length == 10
      books.each do |book|
        assert book.is_a? Book
      end
    end
  end

  it "Must prioritize book search with query specific to search term" do
    VCR.use_cassette("specific-term-search") do
      books = GoogleBooks.search("Eric","inauthor:")

      assert books[0].authors[0].include? "Eric"
    end
  end

  it "Retrieves nil when given no query" do
    VCR.use_cassette("no-query-term") do
      books = GoogleBooks.search(nil,nil)

      assert_nil books
    end
  end

  it "Retrieves nil when given the wrong search terms with no matching items" do
    VCR.use_cassette("bad-search-terms") do
      books = GoogleBooks.search("dlaksdjfas","inauthor:")

      assert_nil books

    end
  end

  it "Search method raises error when given wrong number of arguments" do
    assert_raises ArgumentError do
      books = GoogleBooks.search("argument")
    end
  end

end
