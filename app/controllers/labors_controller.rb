class LaborsController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @jobs = Job.all
    @jobs_count = @jobs.count
  end
end
