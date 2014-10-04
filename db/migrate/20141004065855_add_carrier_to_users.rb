class AddCarrierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :carrier, :text
  end
end
