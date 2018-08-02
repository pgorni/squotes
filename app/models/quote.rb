class Quote < ApplicationRecord
  validates :quote_text, presence: true
  validates_date :recorded_at, allow_blank: true

  def to_irc
    "[#{self.recorded_at.blank? ? Time.at(0) : self.recorded_at}] <#{self.author.blank? ? "anonymous" : self.author}> #{self.quote_text}"
  end
  
end
