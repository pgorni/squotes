require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the QuotesHelper. For example:
#
# describe QuotesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe QuotesHelper, type: :helper do
  it "turns a quote to an IRC-formatted quote" do 
    q = Quote.new(
      author: "rspec",
      quote_text: "hello there!",
      recorded_at: "2018-08-01 00:00:00 UTC",
      origin: "irc"
    )

    expect(to_irc(q)).to eql("[2018-08-01 00:00:00 UTC] <rspec> hello there!")
  end

  context "when rendering the metadata line" do
    it "displays the author as anonymous if they're unknown" do
      q = Quote.new(
        quote_text: "something"
      )

      expect(metadata_line(q)).to eql("anonymous, origin: unknown")
    end

    it "renders fully" do
      q = Quote.new(
        quote_text: "something",
        author: "rspec",
        origin: "spec tests",
        recorded_at: "2018-08-01"
      )

      expect(metadata_line(q)).to eql("rspec, origin: spec tests, recorded at 2018-08-01")

      # ...a couple more cases here
    end
  end
end
