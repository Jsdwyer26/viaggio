class City < ActiveRecord::Base
	has_many :posts
	has_attached_file :image, styles: { large: "500x500>", medium:"600x600>", thumb: "100x100>"}, default_url: "http://www.clipartbest.com/cliparts/7Ta/MKy/7TaMKyzLc.png"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] 
end
