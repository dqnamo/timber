class Log < ApplicationRecord
  belongs_to :event
  belongs_to :identified_user, optional: true
end

