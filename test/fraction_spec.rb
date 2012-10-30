require 'fraction'

describe Fraction do

	it "Debe existir un numerador" do
		Fraction.new(1, 5).num.should == 1
	end
	
	it "Debe existir un denominador" do
		Fraction.new(1, 5).denom.should == 5
	end

	it "Debe de estar en su forma reducida" do
		Fraction.new(20, 30).should == Fraction.new(2, 3)
		Fraction.new(-30, 45).should == Fraction.new(-2, 3)
	end

	it "No puede existir un denominador que sea igual a cero" do
		expect { Fraction.new(1, 0) }.to raise_error(TypeError)
	end
	
	it "Se debe invocar al metodo num() para obtener el numerador" do
		Fraction.new(1, 5).respond_to?("num").should == true
	end
	
	it "Se debe invocar al metodo denom() para obtener el denominador" do
		Fraction.new(1, 5).respond_to?("denom").should == true
	end

	it "Se debe mostar por la consola la fraccion de la forma: a/b, donde a es el numerador y b el denominador" do
		Fraction.new(1, 5).to_s.should == "1/5"
		Fraction.new(35, 100).to_s.should == "7/20"
		Fraction.new(-3, 6).to_s.should == "-1/2"
	end

	it "Se debe mostar por la consola la fraccion en formato flotante" do
		Fraction.new(1, 5).to_f.should == 1/5
		Fraction.new(35, 100).to_f.should == 7/20
		Fraction.new(-3, 6).to_s.should == "-1/2"
	end

	it "Se debe comparar si dos fracciones son iguales con ==" do
		Fraction.new(14, 21).should == Fraction.new(2, 3)
		Fraction.new(2, 3).should == Fraction.new(-2, -3)
		Fraction.new(-2, 3).should == Fraction.new(2, -3)
	end

	it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
		Fraction.new(-3, -5).abs.should == Fraction.new(3, 5)
		Fraction.new(-3, 5).abs.should == Fraction.new(3, 5)
		Fraction.new(20, -30).abs.should == Fraction.new(2, 3)
	end

	it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
		Fraction.new(20, 30).reciprocal.should == Fraction.new(3, 2)
		Fraction.new(-3, 4).reciprocal.should == Fraction.new(4, -3)
		Fraction.new(3, -4).reciprocal.should == Fraction.new(-4, 3)
		Fraction.new(-3, 4).reciprocal.should == Fraction.new(-4, 3)
		Fraction.new(-3, -4).reciprocal.should == Fraction.new(-4, -3)
		Fraction.new(-3, -4).reciprocal.should == Fraction.new(4, 3)
	end

	it "Se debe calcular el opuesto de una fraccion con -" do
		(-Fraction.new(1, 4)).should == Fraction.new(-1, 4)
		(-Fraction.new(1, 4)).should == Fraction.new(1, -4)
		(-Fraction.new(-1, 4)).should == Fraction.new(-1, -4)
		(-Fraction.new(-1, 4)).should == Fraction.new(1, 4)
	end

	it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
		(Fraction.new(1, 4) + Fraction.new(1, 6)).should == Fraction.new(5, 12)
		(Fraction.new(2, 5) + Fraction.new(4, 6)).should == Fraction.new(16, 15)
		(Fraction.new(1, 5) + Fraction.new(-4, 6)).should == Fraction.new(-7, 15)
	end

	it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
		(Fraction.new(-3, 4) - Fraction.new(3, 2)).should == Fraction.new(9, -4)
		(Fraction.new(3, 4) - Fraction.new(3, 2)).should == Fraction.new(-3, 4)
		(Fraction.new(3, 4) - Fraction.new(3, 2)).should == Fraction.new(3, -4)
	end

	it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
		(Fraction.new(1, 2) * Fraction.new(1, 2)).should == Fraction.new(1, 4)
		(Fraction.new(-2, 4) * Fraction.new(3, 6)).should == Fraction.new(-1, 4)
		(Fraction.new(-2, 4) * Fraction.new(-3, 6)).should == Fraction.new(1, 4)
	end

	it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
		(Fraction.new(1, 2) / Fraction.new(1, 2)).should == Fraction.new(1, 1)
		(Fraction.new(-2, 4) / Fraction.new(3, 6)).should == Fraction.new(-1, 1)
		(Fraction.new(-2, 4) / Fraction.new(-3, 6)).should == Fraction.new(1, 1)
		(Fraction.new(2, 4) / Fraction.new(3, 17)).should == Fraction.new(17, 6)
	end

	it "Se debe calcular el resto dos fracciones con % y dar el resultado de forma reducida" do
		(Fraction.new(1, 2) % Fraction.new(1, 2)).should == Fraction.new(0, 1)
		(Fraction.new(-2, 4) % Fraction.new(3, 6)).should == Fraction.new(0, 1)
		(Fraction.new(-2, 4) % Fraction.new(-3, 6)).should == Fraction.new(0, 1)
		(Fraction.new(2, 4) % Fraction.new(3, 17)).should == Fraction.new(5, 34)
	end

	it "Se debe de poder comprobar si una fracion es menor que otra" do
		(Fraction.new(1, 3) < Fraction.new(1, 2)).should == true
		(Fraction.new(8, 6) < Fraction.new(4, 3)).should == false
		(Fraction.new(-1, 4) < Fraction.new(1, 2)).should == true
	end
	
	it "Se debe de poder comprobar si una fracion es mayor que otra" do
		(Fraction.new(1, 2) > Fraction.new(1, 3)).should == true
		(Fraction.new(4, 3) < Fraction.new(8, 6)).should == false
		(Fraction.new(1, 2) > Fraction.new(-1, 4)).should == true
	end

	it "Se debe de poder comprobar si una fracion es menor o igual que otra" do
		(Fraction.new(1, 3) <= Fraction.new(1, 2)).should == true
		(Fraction.new(4, 3) <= Fraction.new(1, 2)).should == false 
		(Fraction.new(-1, 4) <= Fraction.new(1, -4)).should == true
	end
	
	it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
		(Fraction.new(1, 2) >= Fraction.new(1, 3)).should == true
		(Fraction.new(1, 2) >= Fraction.new(4, 3)).should == false
		(Fraction.new(1, -4) >= Fraction.new(-1, 4)).should == true
	end

end
