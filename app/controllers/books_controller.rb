class BooksController < ApplicationController
  def index
    @books = Book.sorted
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def edit
  end

  def delete
  end
end
