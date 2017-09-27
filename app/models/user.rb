class User < ActiveRecord::Base
  has_many :categories
  has_many :todos
  has_secure_password validations: :false
end
