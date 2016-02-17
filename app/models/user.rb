class User < ActiveRecord::Base
  has_secure_password
  has_many :products 
  has_many :sales , dependent: :destroy
  has_many :sales_products, through: :sales, source: :product


   EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i  
   validates :email, :first_name, :last_name,  presence: true 
   validates :email, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX }
   validate :password, confirmation: true, presence: true, on: :create 
   validate :password_confirmation, presence: true, on: :create
   validate :password,  on: :update, allow_blank: true
end
