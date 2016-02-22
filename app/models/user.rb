class User < ActiveRecord::Base
  has_many :ideas
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :password, length: {minimum: 6}
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
