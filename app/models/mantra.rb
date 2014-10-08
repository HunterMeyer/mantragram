class Mantra < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/gif', 'image/png']
  validates_attachment_size :image, less_than: 5.megabytes
  scope :active, -> { where(status: 'Active') }

  def deliver
    UserMailer.mantra_message(self)
  end

end
