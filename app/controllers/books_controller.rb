class BooksController < ApplicationController
before_action :correct_user, only: [:edit]
#editが動いたら、correct_userが動く。correctが動いたら下のcorrect_userが最初に動く

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
  flash[:notice]="You have created book successfully."
  redirect_to book_path(@book)
 else
  render "index"
 end
 end

 def update
  @book=Book.find(params[:id])
  if@book.update(book_params)  #サーバーからデータを入手するときにあるかかくにんするときはbook_params （手荷物検査みたいなもの！）
    flash[:notice]="You have update book successfully."
   redirect_to book_path(@book)
  else
   render "edit"
  end
 end

  def show
   @book=Book.find(params[:id])
   @user=current_user #なぜならschemaにuser_idが存在しないから
  end

  def edit
   @book=Book.find(params[:id])
  end

  def destroy
   @book=Book.find(params[:id]) #わざわざpermitしなくても良いのでparamsにしている
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
 if @user!=current_user
  redirect_to(books_path)
  end
 end
end