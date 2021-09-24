class User < ApplicationRecord
  has_many :jobs
  has_many :jobs, as: :creator
  has_many :contact_requests
  has_many :subscriptions
  has_many :pricings
  has_many :roles
  has_many :quotes

  def is_tradesman?
    roles.tradesman.any?
  end

  def is_employer?
    roles.employer.any?
  end

  def is_collaborator?
    roles.collaborator.any?
  end

  def can_access_forum?(job)
    true if is_tradesman? || is_creator?(job)
  end

  def is_creator?(job)
    job.creator.eql?(self)
  end

  def already_quoted(job)
    true if quotes.for_current_job(job).any?
  end

  def previous_quote_id(job)
    previous_quote(job)&.id
  end

  def previous_quote(job)
    quotes.where("id < ?", last_quote(job).id).first
  end

  def last_quote(job)
    quotes.for_current_job(job).last
  end
end
