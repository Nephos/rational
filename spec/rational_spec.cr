require "./spec_helper"

describe Rational do
  it "operators" do
    a = Rational.new(2)
    b = Rational.new(3)
    c = a / b
    d = b / a
    e = Rational.new(3, 4)
    a.num.should eq 2
    a.den.should eq 1
    e.num.should eq 3
    e.den.should eq 4
    a.to_i.should eq 2
    b.to_i.should eq 3
    c.to_i.should eq 0
    c.to_f.round(2).should eq 0.67
    d.to_i.should eq(1)
    d.to_f.should eq(1.5)
    e.to_i.should eq(0)
    e.to_f.should eq(0.75)
    e.to_s.should eq("3/4")
  end

  it "reduction of 2/4" do
    a = Rational.new(2)
    b = Rational.new(4)
    c = a / b
    c.to_s.should eq("1/2")
  end
end
