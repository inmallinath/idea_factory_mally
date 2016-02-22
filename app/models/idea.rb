class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false},
                    length: {minimum: 7, maximum: 255}
  validates :body, presence: true

  def user_full_name
    user.full_name if user
  end
end
