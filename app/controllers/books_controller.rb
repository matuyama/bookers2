class BooksController < ApplicationController
  def new

  end

  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    @user = current_user
    if @new_book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end


  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def index
    @books = Book.all
    @user = current_user
    @new_book = Book.new
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
