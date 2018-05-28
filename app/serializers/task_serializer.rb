# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :date, :is_completed, :location,
             :description, :user_id
  # has_one :user
end
