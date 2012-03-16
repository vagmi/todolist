class Item < ActiveRecord::Base
  belongs_to :bucket
  belongs_to :user
  has_many :taggings
  has_many :tags, :through=>:taggings
  validates_presence_of :content
  
  def complete
    self.status = true
    self.save
  end
end
