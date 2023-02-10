class ClientsController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @jobs = Job.where(user_id: current_user.id)
    # @jobs = Job.all
    @job = Job.find_by(params[:id])
    @jobs_count = Job.where(user_id: current_user.id).count
    # @jobs = @jobs.paginate(:page => params[:page], :per_page => 10)
    @jobs.each do |job|
      if job.application_deadline < Date.today
        job.destroy
      end
    end
  end

  def map
    @users = User.all

    @labor_users = User.where(role: 'labor')
  end
end
