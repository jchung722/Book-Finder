class Book
  attr_reader :title, :authors, :publisher, :image, :link

  def initialize(title, authors, publisher, image, link)

    @title = title
    @authors = authors
    @publisher = publisher
    @image = image
    @link = link

  end

end
