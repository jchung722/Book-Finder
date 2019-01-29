class BooksController < ApplicationController
  def index
    if params[:q].present?
      @data = BooksApiWrapper.search(params[:q], params[:search])
    end
  end

  def show
  end
end
