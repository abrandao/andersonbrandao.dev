class PostsController < ApplicationController
  
  layout 'welcome'

  before_action :authorize, only: [:index, :new, :create, :edit, :update, :delete]

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    post = Post.create! post_params
    redirect_to post
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :subtitle, :content)
  end  
end