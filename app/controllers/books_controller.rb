class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
     @books = Book.all
     render action: :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
  redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
  else
  @books = Book.all
  render action: :edit
  end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render action: :edit
    else
      redirect_to books_path
    end
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
