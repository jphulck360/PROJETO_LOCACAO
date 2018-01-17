class AddAttachmentPhoneToModelCars < ActiveRecord::Migration
  def self.up
    change_table :model_cars do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :model_cars, :photo
  end
end
