class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :bug
  has_many :likes, as: :target
end
