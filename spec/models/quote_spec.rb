require 'rails_helper'

RSpec.describe Quote, type: :model do
  it "can be turned to an IRC-style quote" do
    q = Quote.new(
      author: "rspec",
      quote_text: "hello there!",
      recorded_at: "2018-08-01 00:00:00 UTC",
      origin: "irc"
    )

    expect(q.to_irc).to eql("[2018-08-01 00:00:00 UTC] <rspec> hello there!")
  end

  it "is invalid if there's no actual quote text" do
    q = Quote.new(
      author: "rspec"
    )

    expect(q).to_not be_valid
  end

  it "is invalid if an incorrect date is given" do
    q = Quote.new(
      quote_text: "*crickets*",
      recorded_at: "right now"
    )

    expect(q).to_not be_valid
  end

  context "when trying to render" do
    it "renders without the author if the author's unknown" do
      q = Quote.new(
        quote_text: "something"
      )

      expect(q.render).to eql("something, origin: unknown")
    end

    it "renders fully" do
      q = Quote.new(
        quote_text: "something",
        author: "rspec",
        origin: "spec tests",
        recorded_at: "2018-08-01"
      )

      expect(q.render).to eql("something ~rspec, origin: spec tests, recorded at 2018-08-01")
    end

    # ...a couple more cases here
  end
end
