class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  load_and_authorize_resource

  def current_ability
    @current_ability ||= PostAbility.new(current_user)
  end

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
    @post.user.add_role :creator
    if @post.save
      flash[:notice] = 'Post Was Successfully Created!'
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post.user.add_role :editor
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
end
