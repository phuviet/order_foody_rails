# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  first_name      :string
#  last_name       :string
#  middle_name     :integer
#  phone           :string
#  address         :text
#  gender          :integer
#  birthday        :date
#  avatar          :text
#  auth_token      :string
#  confirm_send_at :datetime
#  confirm_token   :string
#  confirm_at      :datetime
#  reset_send_at   :datetime
#  reset_token     :string
#  deleted_at      :datetime
#  role_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ApplicationRecord
  has_secure_password
  has_paper_trail
  acts_as_paranoid

  mount_uploader :avatar, ImageUploader

  # ================Association=====================
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :role
  has_many :votes

  # ================ENUMS=====================
  enum gender: %w[male female other]

  # ================Validates=====================
  validates :email, presence: true
  validates :password_confirmation, presence: true, on: %i[create update],
                                    unless: :skip_password_validation
  validates :email, uniqueness: { scope: :deleted_at }
  validates_confirmation_of :password
  validates_format_of :email, with: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates_format_of :phone, with: /(09+([0-9]{8})|01+([0-9]{9}))/

  # ==============Attr-Accessor===============
  attr_accessor :skip_password_validation
end
