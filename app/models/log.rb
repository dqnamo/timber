class Log < ApplicationRecord
  belongs_to :event
  belongs_to :identified_user, optional: true

  def created_at
    public_created_at || super
  end
end

