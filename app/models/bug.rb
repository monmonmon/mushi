# coding: utf-8
class Bug < ActiveRecord::Base
  belongs_to :bug

  validates :name, uniqueness: true
  validates :keyname, uniqueness: true

  def to_param
    keyname
  end
end
