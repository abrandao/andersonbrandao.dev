class PostsController < ApplicationController
  
  layout 'welcome'

  before_action :authorize, only: [:new, :create, :edit, :update, :delete]

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