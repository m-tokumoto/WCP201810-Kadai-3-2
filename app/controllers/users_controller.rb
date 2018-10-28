class UsersController < ApplicationController
  def index
  	@book = Book.new
  	@user = User.find(current_user.id)
  	@users = User.all
  end

  def show
  	@book = Book.new
    @books = User.find(params[:id]).books.all
  	@user = User.find(params[:id])
  end

  def create
    @book = Book.new
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
