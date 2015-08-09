class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :bug
  has_many :likes, as: :target
  has_many :comments
end
