class School < ApplicationRecord
  has_many :user_connectors, dependent: :destroy
  has_many :users, through: :user_connectors
  has_many :school_messages, dependent: :destroy

  validates_presence_of :name
end
