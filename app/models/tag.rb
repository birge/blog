class Tag < ActiveRecord::Base
  has_many :entry_tags
  has_many :entries, through: :entry_tags

  validates :tagType, presence: true
end
