class Quote < ApplicationRecord
  validates :quote_text, presence: true
  validates_date :recorded_at, allow_blank: true

  before_save :handle_blank_values

  def handle_blank_values
    self.author = 'anonymous' if self.author.blank?
    self.origin = 'unknown' if self.origin.blank?
    self.recorded_at = Time.at(0) if self.recorded_at.blank?
  end
end
