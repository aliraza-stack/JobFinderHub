class Job < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :required_skills, presence: true
  validates :salary, presence: true
  validates :job_type, presence: true
  validates :company, presence: true
  validates :contact, presence: true

end
