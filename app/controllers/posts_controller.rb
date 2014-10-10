class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "New Post"
			redirect_to @post
		else
			flash[:notice] = "Not post for you"
			render :new
		end

	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "Post Updated!"
			redirect_to @post
		else
			flash[:alert] = "Post could not be updated!"
			render :edit
		end
	end

	def destroy
		@chip.destroy
		flash[:notice] = "Post has been deleted"
		redirect_to users_path
	end

	private

	def post_params
		params.require(:post).permit(:post_title, :post_content, :post_tags, :bootsy_image_gallery_id).merge(user_id: current_user.id)
	end

	def set_post
		@post = Post.find(params[:id])
	end

end