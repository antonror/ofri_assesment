class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :job

  scope :for_current_job, -> (job) { where(job_id: job.id) }
end
