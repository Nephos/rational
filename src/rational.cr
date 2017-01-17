require "./rational/*"

class Rational
  getter num : Int32
  getter den : Int32

  def initialize(@num, @den = 1)
    reduce
  end

  def to_i
    self.num / self.den
  end

  def to_f
    self.num.to_f / self.den.to_f
  end

  def to_s
    "#{self.num}/#{self.den}"
  end

  def ==(rhs : Rational)
    @num == rhs.num && @den == rhs.den
  end

  def +(rhs : Rational)
    denominator = @den * rhs.den
    num1 = @num * rhs.den
    num2 = rhs.num * @den
    Rational.new num1 + num2, denominator
  end

  def +(rhs : Number::Primitive)
    Rational.new @num + @den * rhs, @den
  end

  def -(rhs : Rational)
    self + Rational.new(-rhs.num, rhs.den)
  end

  def -(rhs : Number::Primitive)
    Rational.new @num * rhs, @den
  end

  def *(rhs : Rational)
    Rational.new @num * rhs.num, @den * rhs.den
  end

  def *(rhs : Number::Primitive)
    Rational.new (rhs * @den) + @num, @den
  end

  def /(rhs : Rational)
    Rational.new @num * rhs.den, @den * rhs.num
  end

  def /(rhs : Number::Primitive)
    Rational.new @num, @den * rhs
  end

  def reduce
    gcd = self.num.gcd(self.den)
    @num /= gcd
    @den /= gcd
    self
  end
end
