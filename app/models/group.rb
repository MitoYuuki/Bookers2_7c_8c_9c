class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :group_memberships
  has_many :members, through: :group_memberships, source: :user

  has_one_attached :group_image

  validates :name, presence: true

  has_many :events
end
