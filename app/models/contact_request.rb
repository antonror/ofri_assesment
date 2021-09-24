class ContactRequest < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :job, optional: true

  PURPOSES = {
    contact: 'CONTACT US'
  }
end
