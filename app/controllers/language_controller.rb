class LanguageController < ApplicationController
	
	def update
    	session[:locale] = params[:locale]
    	redirect_to(:back)
	end

end