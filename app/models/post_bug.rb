class PostBug < ActiveRecord::Base
  belongs_to :post
  belongs_to :bug
end
