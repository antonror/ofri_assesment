class JobsController < ApplicationController
  def show
    render json: @job
  end
end