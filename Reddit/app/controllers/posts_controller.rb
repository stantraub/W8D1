class PostsController < ApplicationController
  before_action :require_logged_in!
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save

    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_ids)
  end
end
