class Entry < ActiveRecord::Base
  has_many :entry_tags
  has_many :tags, through: :entry_tags

  validates :title, presence: true
  validates :body, presence: true
end
