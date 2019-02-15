require 'test_helper'

describe BooksApiWrapper do

  it "must initialize with an api class object" do
    wrapper = BooksApiWrapper.new(GoogleBooks)
  end

  it "must correctly assign api info to wrapper" do
    wrapper = BooksApiWrapper.new(GoogleBooks)
    assert wrapper.api == GoogleBooks
  end

  it "must fail when initialized without an argument" do
    assert_raises ArgumentError do
      wrapper = BooksApiWrapper.new()
    end
  end

  it "Can Retrieve a list of books based on query" do
    VCR.use_cassette("books") do
      wrapper = BooksApiWrapper.new(GoogleBooks)
      books = wrapper.search("Harry","")

      assert books.is_a? Array
      assert books.length == 10
      books.each do |book|
        assert book.is_a? Book
      end
    end
  end

  it "Can Retrieve a list of books based on a query and search term" do
    VCR.use_cassette("books-with-search-terms") do
      wrapper = BooksApiWrapper.new(GoogleBooks)
      books = wrapper.search("Harry","inauthor:")

      assert books.is_a? Array
      assert books.length == 10
      books.each do |book|
        assert book.is_a? Book
      end
    end
  end

  it "Must prioritize book search with query specific to search term" do
    VCR.use_cassette("specific-term-search") do
      wrapper = BooksApiWrapper.new(GoogleBooks)
      books = wrapper.search("Eric","inauthor:")


      assert books[0].authors[0].include? "Eric"
    end
  end

  it "Retrieves nil when given no query" do
    VCR.use_cassette("no-query-term") do
      wrapper = BooksApiWrapper.new(GoogleBooks)
      books = wrapper.search(nil, nil)

      assert_nil books
    end
  end

  it "Retrieves nil when given the wrong search terms with no matching items" do
    VCR.use_cassette("bad-search-terms") do
      wrapper = BooksApiWrapper.new(GoogleBooks)
      books = wrapper.search("dlaksdjfas","inauthor:")

      assert books == nil
    end
  end

  it "search method error when given wrong number of arguments" do
    assert_raises ArgumentError do
      wrapper = BooksApiWrapper.new(GoogleBooks)
      books = wrapper.search("inauthor:")
    end
  end
end
