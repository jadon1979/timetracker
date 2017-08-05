class Task < ApplicationRecord
  belongs_to :feature, inverse_of: :tasks

  validates :summary, presence: true

  def total_tasks
    tasks.count
  end
end
