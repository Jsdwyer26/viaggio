class User < ActiveRecord::Base
	has_many :posts
	has_secure_password
	has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>"}, default_url: "http://www.riverstagetheatre.org/wp-content/uploads/2012/06/missing.png" 
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
