# coding: utf-8
class Bug < ActiveRecord::Base
  belongs_to :bug
  has_many :post_bugs
  has_many :posts, through: :post_bugs

  validates :name, uniqueness: true
  validates :keyname, uniqueness: true

  def to_param
    keyname
  end
end
