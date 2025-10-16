require "string_calculator"

RSpec.describe StringCalculator do
  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eql(0)
  end
end
