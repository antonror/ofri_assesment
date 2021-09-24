class Pricing < ApplicationRecord
  belongs_to :user
  scope :current, -> { where(current: true) }
  scope :v5, -> { where(version: 'v5') }
end
