class UsersController < ApplicationController

	def home
	end

	def user_edit
		@user = current_user
	end

	def index
		@users =User.all
		@books =Book.all
		@book = Book.new
		@user = current_user
	end

	def new
		@user = User.new
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end

	def create
		@user = User.new(user_params)
		@user.user_id = current_user.id
		@user.save
		redirect_to user_path

	end

	def edit
        @user = User.find(params[:id])
        if current_user.id != @user.id
        	redirect_to user_path(current_user)
        end
    end
    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
    	redirect_to user_path(@user.id)
 	    else
 	     flash[:alert] = "Introduction is too long (maximum is 50 characters)"
 	     render action: :edit
 	    end
    end

	private


	def user_params
		params.require(:user).permit(:name, :image, :introduction)
	end
end