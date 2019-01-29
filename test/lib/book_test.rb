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

  it "must be initalized with a title, author, publisher, image, and link" do
    book = Book.new("The Little Prince", "Antoine Saint-Exupery", "Publisher", "image", "link")
    assert book.is_a? Book
  end

  it "must raise an error if not initialized with enough arguments" do
    assert_raises ArgumentError do
      Book.new("The Jungle")
    end
    assert_raises ArgumentError do
      Book.new("The Little Prince", "Antoine Saint-Exupery", "Publisher", "image")
    end
  end

end
