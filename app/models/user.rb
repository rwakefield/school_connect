class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :user_connectors
  has_many :schools, through: :user_connectors
end
