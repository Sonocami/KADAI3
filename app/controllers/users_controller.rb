class UsersController < ApplicationController

before_action :correct_user, only: [:update]

  def index
   @users=User.all
   @user=current_user
   @book=Book.new
   #@profile_image=@user.profile_image
  #indexでイメージについて書いてあるからいらない？？<%=image_tag user.profile_image.get_profile_image(100,100)%>
  end

  def show
   @user=User.find(params[:id])
   @books=@user.books
  end

  def edit
   @user=User.find(params[:id])
   #URLからIDを見ている
  end

  #def create
  # # @user=User.new(user_params)
  #  @user.user_id=current_user.id
  # if @user.save
  #  flash[:notice]="Welcome! You have signed up successfully."
  #  redirect_to user_path(user.id)
  # else
  #  flash[:notice]="Signed in successfully.."
  #  redirect_to user_path(user.id)
  # end
  #end

  def update
   @user=User.find(params[:id])
  if @user.update(user_params)
   flash[:notice]="You have updated user successfully."
   redirect_to user_path(@user)
  else
   render edit
  end
  end

 #def delete
  #@user=
   #session.delete(@user.id)　#userはURLとは関係ないのでuser.idという記載になり、URLを経由するParams[：id]とは異なる
   #@current_user=nil
   #flash[:notice]="Signed out successfully."
   #redirect_to:root
 #end

private

 def user_params
   params.require(:user).permit(:name,:introduction,:profile_image)
 end

def correct_user
   @user=User.find(params[:id])
   #@user=@user(params[:id])
   if @user != current_user #本人じゃなかったらredirect to
   redirect_to user_path(current_user.id)
   end
end

end