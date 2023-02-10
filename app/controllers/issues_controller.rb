class IssuesController < InheritedResources::Base
  before_action :authenticate_user!

  def create
    @issue = Issue.new(issue_params)
    CrudNotificationMailer.create_notification(@issue).deliver_now
    create! { issues_path }
  end

  def update
    CrudNotificationMailer.update_notification(@issue).deliver_now
    update! { issues_path }
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end

end
