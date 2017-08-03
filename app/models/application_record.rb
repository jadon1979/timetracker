class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort_by(str)
    field, dir = str.split(',')
    reorder("#{field} #{dir}")
  end  
end
