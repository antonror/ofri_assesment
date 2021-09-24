require 'active_support/concern'

module V5::ContactRequestParticipateable
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user, :set_job, :set_purpose, :requires_premium_membership, only: :create
  end

  protected

  def set_current_user
    @current_user = User.last
  end

  def set_job
    @job = Job.find_by_id(permitted_params[:job_id])
  end

  def set_purpose
    @purpose = permitted_params[:purpose]
  end

  def requires_premium_membership
    @action = Participation::ACTIONS[:contact_request]
    @category = @job.categories.first if @job
    if participate_as_basic_member? && @current_user.pricings.v5.any?
      flash[:error] = 'Participation only possible for premium members'
      redirect_to root_path
    end
  end

  private

  def permitted_params
    params.permit(:job_id, :purpose)
  end

  def participate_as_basic_member?
    current_subscription = @current_user.subscriptions.last
    current_subscription.blank? || (current_subscription && !current_subscription.valid?)
  end
end