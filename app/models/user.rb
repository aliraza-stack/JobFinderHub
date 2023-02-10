class User < ApplicationRecord
  # enum role: [:user, :labor]
  enum role: { user: 'user', labor: 'labor' }
  # after_initialize :set_default_role, :if => :new_record?
  has_one_attached :avatar
  has_many :jobs, dependent: :destroy

  validates :email, on: :update, if: proc { |user| user.email_changed? }, presence: true
  validates :name, presence: true
  validates :phone, presence: true, format: { with: /[0-9]/, message: " number is invalid" }
  validates :role, presence: true
  validates :cnic, presence: true, format: { with: /[0-9]/, message: " number is invalid" }, on: :update
  validates :father_name, presence: true, on: :update
  validates :dob, presence: true, on: :update
  validates :skill, presence: true, on: :update, :if => :labor?
  validates :description, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :street, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :state, presence: true, on: :update
  validates :zip, presence: true, on: :update

  def role=(role)
    self[:role] = role.to_s
  end

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable,
         :trackable

  # def set_default_role
  #   self.role ||= :user
  # end
  # def profile_completed?
  #   if role == "labor"
  #     skill.present?
  #   else
  #     name.present? && father_name.present? && role.present? && cnic.present? && dob.present? && description.present? && address.present? && city.present? && state.present? && zip.present?
  #   end
  # end

end
