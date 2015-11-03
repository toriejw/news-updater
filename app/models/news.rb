class News < ActiveRecord::Base
  validates :content, :title, presence: true
end
