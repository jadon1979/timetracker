class Project < ApplicationRecord
  belongs_to :project_status
  belongs_to :creator,
    class_name: 'Employee',
    foreign_key: 'creator_id'

  has_many :features

  validates :name, presence: true

  scope :archived, -> (is_archived) { where(archived: is_archived) }

  def story_points
    features.sum(:story_points)
  end

  def total_features
    features.count
  end
end
