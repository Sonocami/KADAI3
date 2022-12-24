class UsersController < ApplicationController

  def index
   @users=User.all
   @user=current_user
   @book=Book.new
   #@profile_image=@user.profile_image
  #indexでイメージについて書いてあるからいらない？？<%=image_tag user.profile_image.get_profile_image(100,100)%>
  end

  def show
   @user=User.find(params[:id])
   @books=Book.all
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
   redirect_to user_path(user.id)
  else
   flash[:success]="Signed in successfully.."
   redirect_to user_path(user.id)
  end
  end

  def update
   @user=User.find(params[:id])
   @user.update(user_params)
  if @user.update
   flash[:success]="You have updated user successfully."
   redirect_to user_path(user.id)
  else
   render edit_user_path(user.id)
  end
  end

 def delete
   session.delete(user.id)
   @current_user=nil
   flash[:alert]="Signed out successfully."
   redirect_to:root
 end

private

 def user_params
   params.require(:user).permit(:name,:introduction,:profile_image)
 end

 def correct_user
   @user=User.find(params[:id])
   #@user=@user(params[:id])
   redirect_to users_path
  unless
   @user==current_user
  end
 end
end