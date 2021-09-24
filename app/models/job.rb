class Job < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :creator, polymorphic: true, optional: true
  has_many :contact_requests
  has_many :categories
  has_many :quotes
end
