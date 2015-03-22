class Comment < ActiveRecord::Base
  belongs_to :entry

  validates :comment, presence: true
end
