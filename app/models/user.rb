class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  accepts_nested_attributes_for :city
  has_many :gossips, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessageRecipient"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :password, presence: true, length: { in: 6..20}

  def city?
    !self.city.nil?
  end
end