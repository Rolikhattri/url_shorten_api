class Url < ApplicationRecord
  validates :given_link, presence: true
  after_create :generate_slug, :generate_short_link

  def generate_slug
    if self.slug.nil?
      self.slug = self.id.to_s(36)
      self.save
    end
  end

  def generate_short_link
    if self.short_link.nil?
      self.short_link = 'http://ro.li/' + self.slug
      self.save
    end
  end

end
