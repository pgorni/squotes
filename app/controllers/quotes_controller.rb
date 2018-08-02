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

    if @quote.save
      Rails.logger.info("Saved quote (id: #{@quote.id})")
      redirect_to quotes_path, flash: { msg: "Quote added!" }
    else
      Rails.logger.info("Validation errors in quote: #{@quote.errors.messages}")
      render new_quote_path
    end
  end
end
