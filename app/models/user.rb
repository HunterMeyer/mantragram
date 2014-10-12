class User < ActiveRecord::Base
  include Carriers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :mantras
  has_one :style
  before_validation :sanitize_mobile_number
  before_create :set_style
  before_create :activate
  before_create :generate_reference
  before_save :set_smtp_address
  before_destroy :erase_mantras
  validates :mobile_number, numericality: { only_integer: true }, presence: true, uniqueness: true, length: { is: 10 }
  validates :email, uniqueness: { case_sensitive: false }, allow_nil: true, allow_blank: true
  validates :smtp_address, uniqueness: { case_sensitive: false }
  validates :carrier, presence: true

  def email_required?
    false
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if mobile_number = conditions.delete(:mobile_number)
      where(conditions).where(["mobile_number = :value", { :value => mobile_number }]).first
    else
      where(conditions).first
    end
  end

  def reset_style
    self.style.destroy
    Style.create(user_id: self.id)
  end

  private

  def sanitize_mobile_number
    self.mobile_number = mobile_number.gsub(/[^0-9]/, '') if attribute_present?('mobile_number')
  end

  def set_style
    Style.create(user_id: self.id)
  end

  def activate
    self.status = 'Active'
  end

  def generate_reference
    self.reference = "#{DateTime.now.to_i}#{SecureRandom.hex(3)}"
  end

  def set_smtp_address
    self.smtp_address = (self.mobile_number + domain_name(self.carrier)) if self.carrier_changed?
  end

  def erase_mantras
    self.mantras.each { |m| m.destroy }
  end

end
