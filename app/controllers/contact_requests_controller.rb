class ContactRequestsController < ApplicationController
  include V5::ContactRequestParticipateable

  def create
    redirect_to root_path and return unless @job

    @contact_request = ContactRequest.new(user_id: @current_user.id, job_id: @job.id, purpose: @purpose)

    if @contact_request.save
      EmailNotification.contact_request_employer(recipient_address: @job.creator.email,
                                                       tradesman: @current_user,
                                                       job: @job,
                                                       job_url: @job.url,
                                                       contact_request_id: @contact_request.id,
                                                       job_creator: @job.creator,
                                                       subject: I18n.t(:contact_request_for),
                                                       purpose: ContactRequest::PURPOSES[@purpose.to_sym])
      redirect_back fallback_location: job_path(@job)
      flash[:notice] = I18n.t(:contact_request_sent_to_employer)
    else
      redirect_to root_path
      flash[:error] = @contact_request.errors.full_messages.join(', <br> ').html_safe
    end
  end
end