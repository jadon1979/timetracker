class Employee < ApplicationRecord
  belongs_to :role

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  def full_name
    "%s %s" % [first_name, last_name]
  end
end
