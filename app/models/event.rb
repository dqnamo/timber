class Event < ApplicationRecord
  belongs_to :project
  has_many :logs, dependent: :destroy

  def last_occurred_at
    logs.maximum(:created_at)
  end

  def display_name
    "#{icon} #{name}"
  end
end

