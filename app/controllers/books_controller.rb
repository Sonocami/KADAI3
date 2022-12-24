class BooksController < ApplicationController

 def new
  @books=Book.new
 end

 def index
  @books=Book.all
  #@book=Book.find(params[:id])
  @user=current_user
 end

 def create
  @books=Book.all
  @user=current_user
  @book=Book.new(book_params)
  @book.user_id=current_user.id
 if @book.save
  flash[:success]="You have created book successfully."
  redirect_to books_path(book.id)
 else
  render:index
 end
 end

 def update
  @book=Book.find(params[:id])
  @book.update(books_params)
 if @book.update
   flash[:success]="You have update book successfully."
   redirect_to book_path(book.id)
 else
   render:edit_book_path
 end
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
  end

 private

 def book_params
   params.require(:book).permit(:title,:body)
 end

 def correct_user
  @book=Book.find(params[:id])
  @user=@book.user
  redirect_to(books_path)
 unless
  @user==current_user
 end
 end
end