class Message < ApplicationRecord
  ACCEPTED_TYPES = ['SchoolMessage']

  validates_presence_of :header, :body
  validates_inclusion_of :type, in: ACCEPTED_TYPES
end
