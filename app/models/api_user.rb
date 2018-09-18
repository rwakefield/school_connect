class ApiUser < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
end
