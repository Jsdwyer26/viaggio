class LanguageController < ApplicationController
	
	def update
    	session[:locale] = params[:locale]
    	render text: "language updated", status: 201
	end

end