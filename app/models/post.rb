class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :city
	validates_length_of :title, :within => 1..200, :notice => "Title needs to be between 1 and 200 characters"
	validates_length_of :body, :minimum => 1, :notice => "Post cannot be empty"
	validates_presence_of :city_id, :notice => "Need to select a city"
	validates_numericality_of :city_id, :notice => "Need to select a city"
end
