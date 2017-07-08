class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
