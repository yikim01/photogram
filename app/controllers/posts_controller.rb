class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
<<<<<<< HEAD
    # for a new action create new current_user.posts object
=======
>>>>>>> 121767c2a13bb48acc15f25391e906670f21746e
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to @post
    else
      flash.now[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to root_path
    else
      flash.now[:alert] = "Update failed. Please check the form."
      redirect_to root_path
    end
  end

  def destroy
    @post.destroy
<<<<<<< HEAD
    flash[:success] = "Your post has been sucessfully deleted."
=======
    flash[:success] = 'Post deleted.'
>>>>>>> 121767c2a13bb48acc15f25391e906670f21746e
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
<<<<<<< HEAD
    unless current_user == @post.user
=======
    unless @post.user.id == current_user.id
>>>>>>> 121767c2a13bb48acc15f25391e906670f21746e
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end
<<<<<<< HEAD

=======
>>>>>>> 121767c2a13bb48acc15f25391e906670f21746e
end
