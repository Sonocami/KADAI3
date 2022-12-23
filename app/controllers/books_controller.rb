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
  if @book.save
  flash[:success]="You have created book successfully."
  redirect_to books_path(:book_id)
 else
  render book_path
 end

 def update
   @book=Book.find(params[:id])
   @book.update(books_params)
   if @book update
   flash[:success]="You have update book successfully."
   redirect_to book_path(:book_id)
  else
   render edit_book_path
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

  def destroy
  @book=Book.fine(book_params[:id])
  @book.destroy
  redirect_to books_path

 private

 def book_params
   params.require(:book).permit(:user,:title,:body)
 end
end
