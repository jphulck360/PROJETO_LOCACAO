class Vehicle < ApplicationRecord
	
	belongs_to :mark
	belongs_to :model_car

	validates_presence_of :nome

	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/png", "image/jpeg", "image/jpg", "image/gif"]
end
