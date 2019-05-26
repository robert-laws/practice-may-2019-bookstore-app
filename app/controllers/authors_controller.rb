class AuthorsController < ApplicationController
  def index
    @authors = Author.sorted
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def edit
  end

  def delete
  end
end
