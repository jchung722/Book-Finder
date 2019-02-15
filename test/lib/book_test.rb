require 'test_helper'

describe Book do

  it "Must initialize attributes properly" do
    book = Book.new("Pride & Prejudice", ["Jane Austen"], "Whitehall", "my_image", "my_link")
    expect(book.title).must_equal "Pride & Prejudice"
    expect(book.authors).must_equal ["Jane Austen"]
    expect(book.publisher).must_equal "Whitehall"
    expect(book.image).must_equal "my_image"
    expect(book.link).must_equal "my_link"
  end

  it "must be initialized with at least title, author, publisher, and link" do
    book = Book.new("The Little Prince", "Antoine Saint-Exupery", "Publisher", "link")
    assert book.is_a? Book
  end

  it "must set image to nil on default if it is not initialized" do
    book = Book.new("The Little Prince", "Antoine Saint-Exupery", "Publisher", "link")
    assert_nil book.image
  end

  it "must raise an error if not initialized with enough arguments" do
    assert_raises ArgumentError do
      Book.new("The Jungle")
    end
    assert_raises ArgumentError do
      Book.new("The Little Prince", "Antoine Saint-Exupery", "Publisher")
    end
  end

  it "Must create book even when initialized with empty fields" do
    book = Book.new(nil, nil, nil, nil, nil)
    assert_nil book.title
    assert_nil book.authors
    assert_nil book.publisher
    assert_nil book.image
    assert_nil book.link
    assert book.is_a? Book
  end

end
