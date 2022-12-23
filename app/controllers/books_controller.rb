class BooksController < ApplicationController

 def new
  @books=Books.new
 end

 def index
  @books=Book.all
  @book=Book.find(params[:id])
 end

 def create
  @book=Books.new(book_params)
  @book.user_id=current_user.id
  @book.save
  redirect_to books_path
 end

 def update
   @book=Book.find(params[:id])
   @book.update(books_params)
   redirect_to book_path(book.id)
 end

  def show
   @book=Book.find(params[:id])
   @user.user_id=current_user.id
  end

  def edit
   @book=Book.find(params[:id])
   @book.update(books_params)
   redirect_to book_path
  end

 private

 def book_params
   params.require(:book).permit(:user,:title,:body)
 end
end
