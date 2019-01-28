class BooksController < ApplicationController
  def index
    if params[:q].present?
      @data = BooksApiWrapper.search(params[:q])
    end
  end

  def show
  end
end
