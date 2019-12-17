class User < ApplicationRecord
  validates :name, presence: true,
                   length: {maximum: 15}
  
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, 
                    format: {with: VALID_EMAIL_REGEX}
  
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  has_secure_password
  validates :password, length: {in: 8..32},
                      format: { with: VALID_PASSWORD_REGEX }
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: "topic"
  has_many :comments
  has_many :commented_topics, through: :comments, source: "topic"
end
