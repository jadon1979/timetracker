class TaskResource < ApplicationRecord
  belongs_to :task, inverse_of: :task_resources
  belongs_to :employee, inverse_of: :task_resources

  validates :summary, presence: true
  validates :hours, presence: true, numericality: true

  scope :by_employee, -> (employee_id) { where(employee_id: employee_id) }
end
