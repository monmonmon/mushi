class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_bugs
  has_many :bugs, through: :post_bugs
  has_many :likes, as: :target
  has_many :comments

  validate :require_bugs_associated, on: :create

  def image(size = :thumb)
    '200x200.png'
  end

  private

    def require_bugs_associated
      if post_bugs.empty?
        errors.add(:base, '1つ以上の昆虫に紐付けて下さい')
      end
    end
end
