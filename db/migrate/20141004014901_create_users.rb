class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text  :mobile_number
      t.text  :smtp_address
      t.text  :email
      t.text  :first_name
      t.text  :last_name
      t.text  :reference
      t.text  :status
      t.boolean :last_delivery_bounced
      t.datetime :last_delivery_bounced_at
      t.timestamps
    end
  end
end
