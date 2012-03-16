class Bucket < ActiveRecord::Base
  has_many :items
  validates_presence_of :name
  belongs_to :user
  attr_accessible :name
end
