class User < ActiveRecord::Base
  validates :username, presence: true, length: {minimum: 2}
  validates :email, presence: true

  has_many :posts

end
