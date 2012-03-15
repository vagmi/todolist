class Item < ActiveRecord::Base
  belongs_to :bucket
  has_many :taggings
  has_many :tags, :through=>:taggings
end
