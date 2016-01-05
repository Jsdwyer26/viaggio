class PostsController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]
  before_filter :post_params
  #temperary function to set city
  before_filter :set_city


  def index
    @posts = Post.all
  end


  def show
    #For demo purposes
    @user = current_user
  end


  def new
    @post = Post.new
  end


  def edit
    unless current_user == @post.user 
      redirect_to user_path(@user)
    end
  end

  def create
    post_params = params.require(:post).permit(:title, :body)
    #@post = current_user.posts.new(post_params)
    @post = Post.new(post_params)
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
    #if current_user == @post.user
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    #end
  end


  def destroy
    #if current_user == @post.user
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  #end
end  

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      post_id = params[:id]
      @post = Post.find_by_id(post_id)
    end
    def set_city
      @city = "Miami"
    end
end
