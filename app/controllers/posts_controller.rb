class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :set_page, only: [:index]
  # page where all the posts will be shown
  def index
    @posts = Post.search(params[:term]).paginate(:page => params[:page], :per_page => 9)
  end

  # the show page for a singular post
  def show
    @conversation = Conversation.new
  end

  # new post page
  def new
    @post = Post.new
  end

  # create action for posts
  def create
    @post = Post.new post_params
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post Created'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Problem creating post'
      render :new
    end
  end

  # edit post page
  def edit
    authorize! :edit, @post
  end

  # update action for a post
  def update
    authorize! :update, @post
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post Updated 🤗'
    else
      render :edit, alert: 'Problem Updating Post 😡'
    end
  end

  # destroy action for a post
  def destroy
    authorize! :destroy, @post
    @post.destroy
    redirect_to posts_path, notice: 'Post Deleted 🚗 💨'
  end

  private

  def post_params
    params.require(:post).permit([
      :make,
      :model,
      :odometer,
      :price,
      :model_year,
      :condition,
      :cylinders,
      :drivetrain,
      :fuel,
      :paint_colour,
      :title_status,
      :transmission_type,
      :image,
      :term,
      :imageurl
      ])
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def set_page
    @page = params[:page] || 0
  end
end
