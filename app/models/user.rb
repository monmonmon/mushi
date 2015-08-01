class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  validates :username, presence: true, uniqueness: true
  validates :email_address, presence: true, uniqueness: true, email: true
end
