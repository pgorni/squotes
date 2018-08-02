class Quote < ApplicationRecord
  validates :quote_text, presence: true
  validates_date :recorded_at, allow_blank: true

  def to_irc
    "[#{self.recorded_at}] <#{self.author}> #{self.quote_text}"
  end

  def render
    if self.origin.match /irc|IRC/
      self.to_irc
    else
      q = self.quote_text
      q << " ~#{self.author}" unless self.author.blank?
      q << ", origin: #{self.origin.blank? ? "unknown" : self.origin}"
      q << ", recorded at #{self.recorded_at.strftime("%F")}" unless self.recorded_at.blank?
      q
    end
  end
end
