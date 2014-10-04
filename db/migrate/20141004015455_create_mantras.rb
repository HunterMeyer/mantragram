class CreateMantras < ActiveRecord::Migration
  def change
    create_table :mantras do |t|
      t.belongs_to :user
      t.text :title, limit: 120
      t.text :description
      t.text :schedule
      t.text :status
      t.boolean :last_delivery_bounced
      t.datetime :last_delivery_bounced_at
      t.timestamps
    end
  end
end
