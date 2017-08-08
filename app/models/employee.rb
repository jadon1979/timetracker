class Employee < ApplicationRecord
  belongs_to :role, inverse_of: :employees

  has_many :projects
  has_many :task_resources
  has_many :tasks, through: :task_resources

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  def full_name
    "%s %s" % [first_name, last_name]
  end
end
