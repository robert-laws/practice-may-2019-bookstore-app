class BooksController < ApplicationController
  def index
    if params[:author_id]
      @books = Author.find(params[:author_id]).books.sorted
    else
      @books = Book.sorted
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    if params[:author_id]
      @book = Book.new(author_id: params[:author_id])
    else
      @book = Book.new
    end
    @authors = Author.sorted
    @book_genres = BookGenre.sorted
    @subjects = Subject.sorted
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
    @book = Book.find(params[:id])
    @authors = Author.sorted
    @book_genres = BookGenre.sorted
    @subjects = Subject.sorted
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_params)
      flash[:notice] = "success|The book has been updated successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def delete
  end

  private

  def book_params
    params.require(:book).permit(:title, :publication_year, :description, :price, :author_id, :book_genre_id, subject_ids: [], subjects_attributes: [:name])
  end
end
