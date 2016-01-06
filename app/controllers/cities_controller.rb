class CitiesController < ApplicationController
  before_filter :authorize

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @city = City.find(params[:id])
    @posts = Post.where(city_id: @city.id)
  end

  # GET /cities/new
  def new
    if current_user.admin == true
      @city = City.new
    else
      redirect_to user_path(current_user), notice: 'Only admin can create or edit cities.'
    end
  end

  # GET /cities/1/edit
  def edit
    if current_user.admin == true
      @city = City.find(params[:id])
    else
      redirect_to user_path(current_user), notice: 'Only admin can create or edit cities.'
    end
  end

  # POST /cities
  # POST /cities.json
  def create
    if current_user.admin == true
      @city = City.new(city_params)
      respond_to do |format|
        if @city.save
          format.html { redirect_to @city, notice: 'City was successfully created.' }
          format.json { render :show, status: :created, location: @city }
        else
          format.html { render :new }
          format.json { render json: @city.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to user_path(current_user), notice: 'Only admin can create or edit cities.'
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    if current_user.admin == true
      respond_to do |format|
        city_params = params.require(:city).permit(:name, :nickName, :image)
        @city = City.find(params[:id])
        if @city.update(city_params)
          format.html { redirect_to @city, notice: 'City was successfully updated.' }
          format.json { render :show, status: :ok, location: @city }
        else
          format.html { render :edit }
          format.json { render json: @city.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to user_path(current_user), notice: 'Only admin can create or edit cities.'
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    if current_user.admin == true
      @city = City.find(params[:id])
      @city.destroy
      respond_to do |format|
        format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to user_path(current_user), notice: 'Only admin can create or edit cities.'
    end
  end

  private
    def city_params
      params.require(:city).permit(:name, :nickName, :image)
    end
end
