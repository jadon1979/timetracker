class Project < ApplicationRecord
  belongs_to :project_status
  belongs_to :creator,
    class_name: 'Employee',
    foreign_key: 'creator_id',
    inverse_of: :projects

  has_many :features

  validates :name, presence: true

  scope :archived, -> (is_archived) { where(archived: is_archived) }
  scope :status, -> (status) {
    return unless !!status
    joins(:project_status)
      .where('LOWER(project_statuses.name) = ?', status.downcase)
  }

  def story_points
    features.sum(:story_points)
  end

  def total_features
    features.count
  end
end
