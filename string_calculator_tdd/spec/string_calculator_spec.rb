require "string_calculator"

RSpec.describe StringCalculator do
  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eql(0)
  end

  it "returns the number itself for a single number" do
    expect(StringCalculator.add("1")).to eq(1)
  end

  it "returns sum of two comma separated numbers" do
    expect(StringCalculator.add("1,5")).to eq(6)
  end

  it "returns sum of all numbers" do
    expect(StringCalculator.add("1,5,10,24")).to eq(40)
  end

  context "when input contains newline as delimiter" do
    it "returns correct sum" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end
    it "returns correct sum" do
      expect(StringCalculator.add("1\n2\n10")).to eq(13)
    end
  end

  context "when input contains semicolon as delimiter" do
    it "returns correct sum" do
      expect(StringCalculator.add("\n2;3")).to eq(5)
    end
    it "returns correct sum" do
      expect(StringCalculator.add("\n2;3;6,19")).to eq(30)
    end
  end

  context "when custom delimiter is given eg. input is like `//[delimiter]\n[numbers…]`" do
    it "supports semicolon as custom delimiter" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end
  end
end
