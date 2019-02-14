class BooksController < ActionController::Base
  def index
    if params[:q].present?
      @data = BooksApiWrapper.search(params[:q], params[:search])
    end
  end

  # for future page navigating to book information
  # def show
  # end
end
