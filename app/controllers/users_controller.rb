class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def comments
	 	@user = User.find(params[:user_id]) 
	end

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Your Account has been created. Welcome to MyBlog."
			redirect_to @user
		else
			flash[:alert] = "Something went wrong. Try Again."
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Your Account has been updated!"
			redirect_to @user
		else
			flash[:alert] = "Something, try again or contact support."
			render :edit
		end
	end

	def destroy
		if @user.destroy
			flash[:notice] = "Account deleted. Bye Bye!"
			redirect_to users_path
		else
			flash[:alert] = "Could not delete. Sorry."
			redirect_to users_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :location, :bio)
	end

	def set_user
		@user = User.find(params[:id])
	end
end