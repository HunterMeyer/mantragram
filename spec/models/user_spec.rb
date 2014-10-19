require 'rails_helper'

describe User, type: :model do

  before { @user = User.create!(mobile_number: '3215551234', carrier: 'T-Mobile', password: 'password') }
  subject { @user }

  it { should have_many :mantras }
  it { should have_one :style }
  it { should validate_presence_of :carrier }
  it { should validate_presence_of :mobile_number }
  it { should validate_uniqueness_of :mobile_number }
  it { should validate_numericality_of :mobile_number }
  it { should validate_uniqueness_of(:email).case_insensitive.allow_nil }

  it 'should scrub common phone number characters' do
    @user.mobile_number = '321-555-0000'
    @user.save!
    expect(@user.mobile_number).to eq '3215550000'
  end

  it 'should ensure mobile numbers are exactly 10 characters' do
    @user.mobile_number = '321-555-11111'
    @user.save
    expect(@user.errors[:mobile_number]).to include 'is the wrong length (should be 10 characters)'
  end

  it 'should set the SMTP address' do
    @user.mobile_number = '321-555-2222'
    @user.carrier = 'Verizon'
    @user.save!
    expect(@user.smtp_address).to eq '3215552222@vtext.com'
  end

  it 'should set the status to active after create' do
    new_user = User.create!(mobile_number: '3215555678', carrier: 'Verizon', password: 'password')
    expect(new_user.status).to eq 'Active'
  end

  it 'should delete all mantras after destroy' do
    new_user = User.create!(mobile_number: '3215555678', carrier: 'Verizon', password: 'password')
    new_user.mantras << Mantra.create!(user_id: new_user.id, title: 'Test title', status: 'Active')
    expect(new_user.mantras.size).to eq 1
    new_user.destroy
    expect(Mantra.where(user_id: new_user.id).size).to eq 0
  end

end