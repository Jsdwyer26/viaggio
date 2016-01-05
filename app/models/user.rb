class User < ActiveRecord::Base
	has_many :posts
	has_secure_password
	has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>"}, default_url: "http://www.riverstagetheatre.org/wp-content/uploads/2012/06/missing.png" 
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_presence_of :email, :notice => "Need an email"
	validates_uniqueness_of :email, :notice => "Email already taken"
	validates_presence_of :name, :notice => "Need a name"
	validates_uniqueness_of :name, :notice => "Name already taken"
end