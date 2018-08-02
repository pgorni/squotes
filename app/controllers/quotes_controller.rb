class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(
      params.require(:quote).permit(:author, :quote_text, :recorded_at, :origin)
    )

    if @quote.valid?
      @quote.save
      Rails.logger.info("Saved quote (id: #{@quote.id})")
      redirect_to quotes_path, flash: { msg: "Quote added!" }
    else
      Rails.logger.info("Validation errors in quote: #{@quote.errors.messages}")
      err = @quote.errors.messages.map { |k, v| k.to_s.gsub("_", " ") + " " + v.join(", ") }.join(",")
      redirect_to quotes_path, alert: "Saving failed due to validation errors: #{err}" 
    end
  end
end
