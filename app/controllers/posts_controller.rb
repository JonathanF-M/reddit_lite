class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  def index
    @posts = Post.all.includes(:community, :user, :comments, :votes)
  end

  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if current_user == @post.user
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to root_path, status: :see_other
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :status, :community_id)
    end
end
