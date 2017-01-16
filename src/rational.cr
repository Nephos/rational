require "./rational/*"

class Rational
  property num : Int32
  property den : Int32

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

  def +(rhs : Rational)
    copy = self.dup
    copy = self.dup
    denominator = copy.den * rhs.den
    num1 = copy.num * rhs.den
    num2 = rhs.num * copy.den
    copy.num = num1 + num2
    copy.den = denominator
    copy.reduce
  end

  def +(rhs : Number::Primitive)
    copy = self.dup
    copy.num += copy.den * rhs
    copy.reduce
  end

  def -(rhs : Rational)
    copy = self.dup
    copy.num = -copy.num
    copy + rhs
  end

  def -(rhs : Number::Primitive)
    copy = self.dup
    copy.num *= rhs
    copy.reduce
  end

  def *(rhs : Rational)
    copy = self.dup
    copy.num += copy.den * rhs
    copy.reduce
  end

  def *(rhs : Number::Primitive)
    copy = self.dup
    copy.num *= rhs
    copy.reduce
  end

  def /(rhs : Rational)
    copy = self.dup
    copy.num *= rhs.den
    copy.den *= rhs.num
    copy.reduce
  end

  def /(rhs : Number::Primitive)
    copy = self.dup
    copy.den *= rhs
    copy.reduce
  end

  def reduce
    gcd = self.num.gcd(self.den)
    self.num /= gcd
    self.den /= gcd
    self
  end
end
