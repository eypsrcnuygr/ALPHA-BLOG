class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }, uniquiness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 105 }, uniquiness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end
