class UsersController < ApplicationController

  def index
   @user=User.all
   @profile_image=User.all
  end

  def show
   @user=User.find(params[:id])
   @profile_image=@user.profile_image
  end

  def edit
   @user=User.find(params[:id])
   @user.update(user_params)
   redirect_to  user_path
  end

 def create
   @user=User.new(user_params)
   @user.user_id=current_user.id
  if @user.save
   flash[:success]="Welcome! You have signed up successfully."
   redirect_to user_path(:user_id)
  else
   flash[:success]="Signed in successfully.."
   redirect_to user_path(:user_id)
  end


  def update
   @user=User.find(params[:id])
   @user.update(user_params)
   if @user.update
   flash[:success]="You have updated user successfully."
   redirect_to user_path(:user_id)
  else
   render edit_user_path(:user_id)
  end

 def destroy
   session.delete(:user_id)
   @current_user=nil
   flash[:alert]="Signed out successfully."
   redirect_to:root
 end


 private

 def user_params
   params.require(:user).permit(:name,:introduction,:profile_image)
 end
end

def correct_user
   @user=User.find(params[:id])
   @user=@user(params[:id])
   redirect_to(users_path)
  unless
   @user==current_user
end

def correct_user
 @book=Book.find(params[:id])
 @user=@book.user redirect_to(books_path)
unless
 @user==current_user
end