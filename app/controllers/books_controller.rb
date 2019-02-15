class BooksController < ApplicationController

  def index
    if params[:q].present?
      google_books_data = BooksApiWrapper.new(GoogleBooks)
      @data = google_books_data.search(params[:q], params[:search])
    end
  end

  # for future page navigating to book information
  # def show
  # end
end
