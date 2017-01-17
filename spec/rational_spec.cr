require "./spec_helper"

describe Rational do
  it "operators" do
    a = Rational.new(2)
    a.num.should eq 2
    a.den.should eq 1

    b = Rational.new(3)
    b.to_i.should eq 3
    e = Rational.new(3, 4)
    e.num.should eq 3
    e.den.should eq 4
    a.to_i.should eq 2
    e.to_i.should eq(0)
    e.to_f.should eq(0.75)
    e.to_s.should eq("3/4")

    c = a / b
    c.to_i.should eq 0
    c.to_f.round(2).should eq 0.67

    d = b / a
    d.to_i.should eq(1)
    d.to_f.should eq(1.5)

    f = a + b
    f.should eq(Rational.new 5)

    g = a - b
    g.should eq(Rational.new -1)

    h = a * b
    h.should eq(Rational.new 6)

    (a == a).should eq(true)
    (a == 2).should eq(true)
    (a == 2.0).should eq(true)
    (a != b).should eq(true)
    (a != 3).should eq(true)
    (a != 3.0).should eq(true)
  end

  it "reduction of 2/4" do
    a = Rational.new(2)
    b = Rational.new(4)
    c = a / b
    c.to_s.should eq("1/2")
  end

  it "numbers tests" do
    ia = 1
    fa = 1.0
    ra = Rational.new 1
    ib = 2
    fb = 2.0
    rb = Rational.new 2
    (ra / rb).to_s.should eq("1/2")
    (ia / rb).to_s.should eq("1/2")
    (ra / ib).to_s.should eq("1/2")
    (ia == ra).should eq(true)
    (ia != rb).should eq(true)
    (fa == ra).should eq(true)
    (fa != rb).should eq(true)
  end
end
