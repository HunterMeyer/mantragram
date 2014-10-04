class Mantra < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/gif', 'image/png']
  validates_attachment_size :image, less_than: 5.megabytes
  scope :active, -> { where(status: 'Active') }

  def deliver
    self.image.present? ? UserMailer.mantra_with_image(self.user, self) : UserMailer.mantra_with_text(self.user, self)
  end

end
