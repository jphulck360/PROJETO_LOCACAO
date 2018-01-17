class Mark < ApplicationRecord
	has_attached_file :photo

	validates_attachment_content_type :photo, :content_type => ["image/png", "image/jpeg", "image/jpg", "image/gif"]
end
