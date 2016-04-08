class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  before_save { self.email = email.downcase }
  validates :chefname, presence: true, length: {minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105 },
                              uniqueness: { case_sensitive: false },#here just having uniqueness as a needed validation makes it require unique keys
                              format:{ with: VALID_EMAIL_REGEX }# REGEX = constant because of CAPS it does not change
  
end
  
  #google RAILS callbacks