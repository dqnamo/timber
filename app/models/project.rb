class Project < ApplicationRecord
  belongs_to :user

  before_validation :generate_api_key, on: :create

  validates :name, presence: true
  validates :api_key, presence: true, uniqueness: true

  has_many :events, dependent: :destroy
  has_many :identified_users, dependent: :destroy
  has_many :logs, through: :events

  private

  def generate_api_key
    self.api_key = SecureRandom.uuid
  end
end

