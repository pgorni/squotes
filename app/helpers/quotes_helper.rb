module QuotesHelper
  def metadata_line(quote)
    m = ""
    m << (quote.author.blank? ? "anonymous" : quote.author)
    m << ", origin: #{quote.origin.blank? ? "unknown" : quote.origin}"
    m << ", recorded at #{quote.recorded_at.strftime("%F")}" unless quote.recorded_at.blank?
    m
  end

  def to_irc(quote)
    "[#{quote.recorded_at.blank? ? Time.at(0) : quote.recorded_at}] <#{quote.author.blank? ? "anonymous" : quote.author}> #{quote.quote_text}"
  end
end
