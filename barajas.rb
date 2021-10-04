require_relative 'carta'

class Baraja
attr_reader :cartas
  def initialize()
    @cartas = []

    pintas = ['C', 'D','E', 'T']

    52.times do |i|
      self.cartas.push(Carta.new(rand(1..13), pintas.sample))
    end
    
  end
  def barajar
    self.cartas.shuffle
  end

  def sacar
    [self.cartas.pop.numero, self.cartas.pop.pinta]
  end

  def repartir
    cinco_primeras= []
    5.times do
      cinco_primeras += [self.cartas.pop.numero, self.cartas.pop.pinta]
    end
    cinco_primeras
    agrupadas = []
    cinco_primeras.each_slice(2){|s| agrupadas<<s}
    agrupadas
  end
end

mazo1 = Baraja.new()
mazo1.barajar
puts " "
print mazo1.sacar
puts " "
print mazo1.repartir
puts " "