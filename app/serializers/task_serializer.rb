class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :date, :is_completed, :location, :description
  has_one :user
end
