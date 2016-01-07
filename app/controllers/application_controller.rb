class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  #Set the locale. key :en is default, files found in /config/locals
  def set_locale
    if session && session[:locale]
      I18n.locale = session[:locale]
    else  
      I18n.locale = :en
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def homepage
    @sanfrancisco = City.find_by_name('San Francisco').id

    @seattle = City.find_by_name('Seattle').id

    @santabarbara = City.find_by_name('Santa Barbara').id

    @miami = City.find_by_name('Miami').id

    @newyork = City.find_by_name('New York').id
    
    render template: "layouts/homepage.html.erb"
  end

end
