class AuthorsController < ApplicationController
  def index
    @authors = Author.sorted
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
    @address = @author.build_address
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash[:notice] = "success|The Author has been successfully saved to the database."
      redirect_to(authors_path)
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
    @address = @author.address || @author.build_address
  end

  def update
    @author = Author.find(params[:id])

    if @author.update_attributes(author_params)
      flash[:notice] = "success|The Author - #{@author.name} - has been updated successfully."
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.delete

    flash[:notice] = "success|The Author - #{@author.name} - has been successfully removed from the database."
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :birth_year, address_attributes: [:id, :street_1, :street_2, :city, :state, :zip_code])
  end
end
