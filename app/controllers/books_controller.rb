class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    byebug
    if @book.save
      redirect_to book_path(@book)
    else
    end
  end

  def edit
    @book = Book.find(params[:id])
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
