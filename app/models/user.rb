class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :mantras
  before_validation :sanitize_mobile_number
  before_create :activate
  before_create :generate_reference
  validates :mobile_number, numericality: { only_integer: true }, presence: true, uniqueness: true, length: { is: 10 }
  validates :email, uniqueness: { case_sensitive: false }
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

  private

  def sanitize_mobile_number
    self.mobile_number = mobile_number.gsub(/[^0-9]/, '') if attribute_present?('mobile_number')
  end

  def activate
    self.status = 'Active'
  end

  def generate_reference
    self.reference = "#{DateTime.now.to_i}#{SecureRandom.hex(3)}"
  end

end
