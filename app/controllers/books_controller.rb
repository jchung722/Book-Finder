class BooksController < ApplicationController
  def index
    if params[:q].present?
      @data = paginate BooksApiWrapper.search(params[:q]), per_page: 10
    end
  end

  def show
  end
end
