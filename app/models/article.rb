class Article < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :user
  validates :title, :body, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "slug", "title", "updated_at", "user_id"]
  end
end