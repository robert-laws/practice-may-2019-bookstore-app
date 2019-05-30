class BooksController < ApplicationController
  def index
    @books = Book.sorted
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @authors = Author.sorted
    @book_genres = BookGenre.sorted
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "success|The book has been successively saved to the database."
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
  end

  def delete
  end

  private

  def book_params
    params.require(:book).permit(:title, :publication_year, :description, :price, :author_id, :book_genre_id)
  end
end
