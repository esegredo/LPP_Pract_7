class Fraction

	attr_reader :num, :denom

	def initialize(num, denom)
		raise TypeError, "Denominator can't be zero" unless (denom != 0)
		div = gcd(num, denom)
		@num = num / div
		@denom = denom / div
	end

	def gcd(a, b)
    b == 0 ? a : gcd(b, a % b)
  end

  def lcm(a, b)
    a / gcd(a, b) * b
  end

	def to_s
		"#{@num}/#{@denom}"
	end

	def to_f
		@num/@denom
	end

	def == (f)
		((@num == f.num) && (@denom == f.denom))
	end

	def abs
		Fraction.new(@num.abs, @denom)
	end

	def reciprocal
		Fraction.new(@denom, @num)
	end

	def -@
		Fraction.new(-@num, @denom)
	end

	def + (f)
		mult = lcm(@denom, f.denom)
		Fraction.new((mult / @denom * @num) + (mult / f.denom * f.num) , mult)
	end

	def - (f)
		self + (-f)
	end

	def * (f)
		Fraction.new(@num * f.num, @denom * f.denom)
	end

	def / (f)
		self * f.reciprocal
	end

	def % (f)
		l = @num * f.denom
		r = @denom * f.num 
		n = l / r 
		Fraction.new(l - n * r, @denom * f.denom)
	end

	def <(f)
		(@num * f.denom) < (@denom * f.num) 
	end

	def >(f)
		(@num * f.denom) > (@denom * f.num) 
	end

	def <=(f)
		(@num * f.denom) <= (@denom * f.num) 
	end

	def >=(f)
		(@num * f.denom) >= (@denom * f.num) 
	end

end
