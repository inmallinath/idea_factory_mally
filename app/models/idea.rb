class Idea < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_many :members, dependent: :destroy
  has_many :joined_users, through: :members, source: :user

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false},
                    length: {minimum: 7, maximum: 255}
  validates :body, presence: true

  def user_full_name
    user.full_name if user
  end

  def like_for(user)
    likes.find_by_user_id user
  end

  def mem_for(user)
    members.find_by_user_id user
  end
end
