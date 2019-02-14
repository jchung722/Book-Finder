module BooksHelper

  # Checks for missing title/publisher field and returns appropriate content
  def book_info(info, tag)
    if info
      return ("<" + tag + ">" + info + "</" + tag + ">").html_safe
    else
      return ("<" + tag + " class='unknown'> Unknown " + "</" + tag + ">").html_safe
    end
  end

  # Checks for missing image field and returns appropriate content
  def book_image(image, title)
    if image
      return ("<img src='" + image + "' class='book_image' alt='" + title + " image'/>").html_safe
    else
      return ("<p class='unknown book_image'> No Image </p>").html_safe
    end
  end

  # Checks for missing author field and returns appropriate content
  def book_authors(authors)
    content = ""
    if authors
      authors.each do |author|
        content += "<p class='author'>" + author+ "</p>"
      end
    else
      content = "<p class='unknown'> Unknown </p>"
    end

    return content.html_safe

  end

end
