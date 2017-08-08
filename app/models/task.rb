class Task < ApplicationRecord
  belongs_to :feature, inverse_of: :tasks

  has_many :task_resources
  has_many :employees, through: :task_resources

  validates :summary, presence: true

  def complete!
    update_attribute(:completed, true)
  end

  def total_hours
    task_resources.sum(:hours)
  end

  def total_hours_by_employee(employee_id)
    task_resources.by_employee(employee_id).sum(:hours)
  end
end
