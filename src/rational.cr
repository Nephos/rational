struct Rational
  getter num : Int32
  getter den : Int32

  def initialize(@num, @den = 1)
    raise DivisionByZero.new "Denominator cannot be zero" if @den == 0
    reduce
  end

  def to_i
    (@num / @den).to_i
  end

  def to_f
    (@num.to_f / @den.to_f).to_f
  end

  def to_s
    @den > 1 ? "#{@num}/#{@den}" : @num.to_s
  end

  def ==(rhs : Rational)
    @num == rhs.num && @den == rhs.den
  end

  {% for op in ["==", "!=", ">", "<", ">=", "<="] %}
    def {{op.id}}(rhs : ::Number::Primitive)
      self.to_f {{op.id}} rhs.to_f
    end
  {% end %}

  def +(rhs : Rational)
    denominator = @den * rhs.den
    num1 = @num * rhs.den
    num2 = rhs.num * @den
    Rational.new num1 + num2, denominator
  end

  def -(rhs : Rational)
    self + Rational.new(-rhs.num, rhs.den)
  end

  def *(rhs : Rational)
    Rational.new @num * rhs.num, @den * rhs.den
  end

  def /(rhs : Rational)
    Rational.new @num * rhs.den, @den * rhs.num
  end

  # Optimised versions of the Rational ones

  def +(rhs : ::Number::Primitive)
    Rational.new @num + @den * rhs, @den
  end

  def -(rhs : ::Number::Primitive)
    Rational.new @num * rhs, @den
  end

  def *(rhs : ::Number::Primitive)
    Rational.new (rhs * @den) + @num, @den
  end

  def /(rhs : ::Number::Primitive)
    Rational.new @num, @den * rhs
  end

  private def reduce
    gcd = @num.gcd(self.den)
    @num /= gcd
    @den /= gcd
    self
  end
end

require "./rational/*"
