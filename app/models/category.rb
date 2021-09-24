class Category < ApplicationRecord
  belongs_to :job, optional: true
end
