class UsersController < ApplicationController


  def create
  @user=User.new(user_params)
  @user.user_id=current_user.id
  @user.save
  redirect_to users_path
  end

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

 private

 def user_params
   params.require(:user).permit(:name,:introduction,:profile_image)
 end
end
