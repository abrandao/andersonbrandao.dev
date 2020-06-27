class Post < ApplicationRecord
  after_validation :set_slug, only: [:create, :update]
  
  has_rich_text :content

  def to_param
    "#{id}-#{slug}"
  end
  
  private

  def set_slug
    self.slug = title.to_s.parameterize
  end
end