class PostsController < ApplicationController

  def index
    @user = current_user
    @posts = Post.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post successfuly created"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    @user = current_user
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @user = current_user

    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :link, :user_id)
    end


end

