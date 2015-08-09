class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, polymorphic: true, counter_cache: true

  class << self
    def like(user, target)
      like = target.likes.where(user_id: user.id).last
      if like.nil?
        like = Like.create(
          target_id: target.id,
          target_type: target.class.name,
          user_id: user.id
        )
      end
      if target.respond_to?(:dislikes)
        target.dislikes.where(user_id: user.id).destroy_all
      end
      like
    end

    def unlike(user, target)
      like = target.likes.where(user_id: user.id).last
      if like
        like.destroy
      end
      nil
    end
  end
end
