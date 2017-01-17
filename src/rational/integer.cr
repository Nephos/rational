module Rational::Int
  {% for op in ["+", "-", "*", "/"] %}
    def {{op.id}}(rhs : Rational)
      Rational.new(self) {{op.id}} rhs
    end
  {% end %}
end

module Rational::Number
  {% for op in ["==", "!=", ">", "<", ">=", "<="] %}
    def {{op.id}}(rhs : Rational)
      self.to_f {{op.id}} rhs.to_f
    end
  {% end %}
end

struct Int
  include Rational::Int
end

struct Number
  include Rational::Number
end
