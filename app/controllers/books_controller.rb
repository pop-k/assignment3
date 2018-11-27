class BooksController < ApplicationController

	before_action :authenticate_user!, except: :about

	def index
		@books =Book.all
		@users =User.all
		@book = Book.new
		@user = current_user
	end

	def about
	end

	def show
		@book_show = Book.find(params[:id])
		@user = @book_show.user
		@book = Book.new
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		 flash[:notice] = "successfully"
		redirect_to book_path(@book)
		else
		 flash[:alert] = "error"
		end
	end

	def edit
		@book = Book.find(params[:id])
		if current_user.id != @book.user_id
			redirect_to books_path
  	 	end
    end

    def update
    	@book = Book.find(params[:id])
    	if @book.update(book_params)
    	redirect_to book_path(params[:id]), notice: "successfully"
    	else
    	 flash[:alert] = "error"
    	 render action: :edit
    	end
    end
    def destroy
    	@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path
    end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end


end
