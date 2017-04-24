class Study < ActiveRecord::Base
	belongs_to :user
  validates :title, presence: true, allow_blank: false
  validates :summary, length: { maximum: 140 }
end