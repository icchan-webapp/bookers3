class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if (@user.id != current_user.id)
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
