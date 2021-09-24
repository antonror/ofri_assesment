class Role < ApplicationRecord
  belongs_to :user

  scope :tradesman, -> { where(name: 'Tradesman') }
  scope :employer, -> { where(name: 'Employer') }
  scope :collaborator, -> { where(name: 'Collaborator') }
end
