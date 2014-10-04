class AddAttachmentImageToMantras < ActiveRecord::Migration
  def self.up
    change_table :mantras do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :mantras, :image
  end
end
