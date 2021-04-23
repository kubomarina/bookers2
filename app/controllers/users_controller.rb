class UsersController < ApplicationController
 before_action :authenticate_user!

 def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
 end

 def edit
  @user = User.find(params[:id])
  if @user == current_user
   render action: :edit
  else
   redirect_to user_path(current_user.id)
  end
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
     redirect_to user_path(@user.id), notice: 'You have updated successfully'
  else
     render action: :edit
  end
 end

 def index
  @users = User.all
  @user = User.new
 end

 private

 def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
 end

 private

   def move_to_signed_in
   unless user_signed_in?
       redirect_to '/users/sign_in'
   end
   end
end
