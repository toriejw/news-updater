class News < ActiveRecord::Base
  validates :content, :title, presence: true

  def formatted_content
    self.content[0..99] + "..."
  end
end
