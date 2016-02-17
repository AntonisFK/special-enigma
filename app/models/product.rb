class Product < ActiveRecord::Base
  belongs_to :user
  has_many :users_sales, through: :sales, source: :user 
  has_many :sales,  dependent: :destroy
end
