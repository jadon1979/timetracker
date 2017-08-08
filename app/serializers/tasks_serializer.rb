class TasksSerializer < ActiveModel::Serializer
  attributes :id, :summary, :completed
end
