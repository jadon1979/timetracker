class Feature < ApplicationRecord
  belongs_to :creator,
    class_name: 'Employee',
    foreign_key: 'creator_id'
  belongs_to :project
end
