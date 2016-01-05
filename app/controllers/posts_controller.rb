class PostsController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]
  before_filter :post_params
  before_filter :set_city


  def index
    @posts = Post.all
    @cities = City.all
  end


  def show
    @user = current_user
  end


  def new
    @post = Post.new
    @city_names = City.all
  end


  def edit
    unless current_user.id == @post.user_id
      redirect_to user_path(current_user)
    end
  end

  def create
    post_params = params.require(:post).permit(:title, :body, :city_id)
    @post = Post.new(post_params)
    @post.city_id = City.find_by_name(post_params['city_id']).id
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    post_params = params.require(:post).permit(:title, :body)
      respond_to do |format|
        if current_user == @post.user && @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end


  def destroy
    if current_user.id == @post.user_id && @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to user_path(current_user)
    end
  end  

  private
    def post_params
      post_id = params[:id]
      @post = Post.find_by_id(post_id)
    end
    def set_city
      @city = "Miami"
    end
end
