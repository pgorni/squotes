module QuotesHelper
  def metadata_line(quote)
    m = "#{quote.author}, origin: #{quote.origin}"
    m << ", recorded at #{quote.recorded_at.strftime("%F")}" unless quote.recorded_at.to_i.zero?
    m
  end

  def to_irc(quote)
    "[#{quote.recorded_at}] <#{quote.author}> #{quote.quote_text}"
  end
end
