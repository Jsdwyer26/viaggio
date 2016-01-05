class UsersController < ApplicationController

  before_filter :authorize, only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
   def create
    user = User.new(user_params)
    puts user
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice] = "Not registered, try again."
      redirect_to '/signup'
    end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  @user = current_user
  user_params = params.require(:user).permit(:name,:email,:current_city,:image)
  if @user.update_attributes(user_params)
    redirect_to user_path(@user)
  else 
    redirect_to edit_user_path
  end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :current_city, :image, :password, :password_confirmation)
    end
end
