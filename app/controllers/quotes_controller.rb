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
      redirect_to quotes_path, flash: { msg: "Quote added!" }
    else
      render :new
    end
  end
end
