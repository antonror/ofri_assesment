# Creates one instance of each class

user = User.create(job_id: 1, email: 'test@test.test')
job = Job.create(user_id: user.id, creator_type: User, creator_id: user.id, url: 'this.is.url')

Category.new(job_id: job.id).save
ContactRequest.new(job_id: job.id, user_id: user.id, purpose: 'contact').save
Subscription.new(user_id: user.id).save
Pricing.new(user_id: user.id, current: true, version: 'v5').save

Role.new(user_id: user.id, name: 'Tradesman').save
Role.new(user_id: user.id, name: 'Employer').save
Role.new(user_id: user.id, name: 'Collaborator').save

Quote.new(user_id: user.id, job_id: job.id).save
