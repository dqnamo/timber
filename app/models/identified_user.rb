class IdentifiedUser < ApplicationRecord
  belongs_to :project
  has_many :logs
end

