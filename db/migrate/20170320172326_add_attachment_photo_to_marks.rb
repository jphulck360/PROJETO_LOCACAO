class AddAttachmentPhotoToMarks < ActiveRecord::Migration
  def self.up
    change_table :marks do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :marks, :photo
  end
end
