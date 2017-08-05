class Feature < ApplicationRecord
  belongs_to :creator,
    class_name: 'Employee',
    foreign_key: 'creator_id'
  belongs_to :project

  has_many :tasks, dependent: :destroy

  validates :summary, presence: true
  validates :story_points, numericality: true

  accepts_nested_attributes_for :tasks,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes[:summary].blank? }

  def total_tasks
    tasks.count
  end
end
