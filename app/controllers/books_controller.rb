class BooksController < ApplicationController
    def new
    	@book = Book.new
    end
    def create
    	@book = Book.new
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
    	@book.save
    	redirect_to books_path
    end
    
    def index
        @book = Book.new
    	@books = Book.all
        @user = current_user
    end
    
    def show
        @book = Book.new
    	@boook = Book.find(params[:id])
        @user = User.find(current_user.id)
    end

    def edit
        @book = Book.new
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        redirect_to book_path(@book.id)
    end

    private
    def book_params
    	params.require(:book).permit(:book_title, :book_body,  :user_id)
    end
end
