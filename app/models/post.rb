class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :city
	validates_length_of :title, :within => 1..200
	validates_length_of :title, :minimum => 1
end
