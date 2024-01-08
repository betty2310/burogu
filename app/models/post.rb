class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: {minimum: 1}
  validates :content, presence: true, length: {minimum: 1}

  acts_as_commontable dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[title]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

end
