class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :active_relationships,
           class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships,
           class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  acts_as_commontator

  def self.ransackable_attributes(auth_object = nil)
    %w[email full_name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[email full_name]
  end

  # Follows a users.
  def follow(other_user)
    following << other_user unless self == other_user
  end

  # Unfollows a users.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current users is following the other users.
  def following?(other_user)
    following.include?(other_user)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end
