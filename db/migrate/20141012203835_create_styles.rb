class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.belongs_to :user
      t.text :background, default: '#E8E8E8'
      t.text :heading, default: '#333'
      t.text :card_background, default: '#FFF'
      t.text :card_title, default: '#525252'
      t.text :card_title_hover, default: '#424242'
      t.text :send_mantra, default: '#428bca'
      t.text :send_mantra_hover, default: '#2A6496'
      t.text :delete_mantra, default: '#F04444'
      t.text :delete_mantra_hover, default: '#CC2828'
      t.text :create_button, default: 'primary'
      t.text :bip, default: '#525252'
      t.text :bip_hover, default: '#424242'
      t.text :navbar, default: '#FFF'
    end
  end
end
