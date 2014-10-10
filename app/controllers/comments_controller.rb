class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
	def index
		@post = Post.find(post_id)
	end

	def show

	end

	def new
		@post = Post.find(post_id)
		@comment = Comment.new(post:@post)
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = "New Comment"
			redirect_to "/posts/#{post_id}"
		else
			flash[:notice] = "No comment for you"
			render :new
		end

	end

	def edit

	end

	def update
		@comment = Comment.find(comment_id)
		if @comment.update(comment_params)
			flash[:notice] = "Comment Updated!"
			redirect_to "/posts/#{@comment.post_id}/comments"
		else
			flash[:alert] = "Comment could not be updated!"
			render :edit
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Comment has been deleted"
		redirect_to users_path
	end

	private

	def comment_params
		params.require(:comment).permit(:comment_content, :post_id).merge(user_id: current_user.id)
	end

	def post_id
		params.require(:post_id)

	end

	def comment_id
		params.require(:id)

	end

	def set_comment
		@post = Post.find(post_id)
		@comment = @post.comments.find(comment_id)

	end

end