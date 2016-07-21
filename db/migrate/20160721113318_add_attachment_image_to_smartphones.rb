class AddAttachmentImageToSmartphones < ActiveRecord::Migration
  def self.up
    change_table :smartphones do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :smartphones, :image
  end
end
