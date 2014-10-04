class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :mantras

  validates :mobile_number, numericality: { only_integer: true }, presence: true, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :smtp_address, uniqueness: { case_sensitive: false }

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

end
