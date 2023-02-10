class JobsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
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


  private

    def job_params
      params.require(:job).permit(:title, :description, :required_skills, :job_type, :salary, :application_deadline, :company, :contact, :user_id)
    end

end
