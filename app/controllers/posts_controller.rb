class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :require_same_user_or_admin, except: %i[index new create show]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post Was Successfully Created!'
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:alert] = 'Post Was Updated Successfully!'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = 'Post Was Deleted Successfully!'
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    attributes = %i[title content post_photo]
    params.require(:post).permit(attributes).merge(user: current_user)
  end

  def require_same_user_or_admin
    return if current_user == @post.user || current_user.admin?

    flash[:notice] = 'You can only perform action on your own articles.'
    redirect_to posts_path
  end
end
