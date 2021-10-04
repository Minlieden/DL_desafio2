class Usuario

  attr_reader :cuentas_bancarias
  
  def initialize(nombre, cuentas_bancarias)
    raise RangeError, "debe agregar a lo menos 1 numero de cuenta" if cuentas_bancarias.count <1
    @nombre = nombre
    @cuentas_bancarias = cuentas_bancarias

  end

  def saldo_total
    total = 0
    self.cuentas_bancarias.each do |cuenta|
      total += cuenta.saldo
    end
    total
  end

end

class CuentaBancaria

  attr_reader :banco, :numero_de_cuenta
  attr_accessor :saldo

  def initialize(banco, numero_de_cuenta,saldo=0)

    @banco = banco
    @numero_de_cuenta = numero_de_cuenta
    @saldo = saldo 
  end

  def transferir(monto, cuenta_destino)
    raise RangeError, "no cuenta con el saldo para realizar esta transaccion" if monto > self.saldo
    self.saldo -= monto 
    cuenta_destino.saldo += monto
  end

end

cuenta1 = CuentaBancaria.new("Banco de Chile", 12345678)
cuenta2 = CuentaBancaria.new("Banco Santander", 16489320, 5000)
cuenta3 = CuentaBancaria.new("Banco Estado", 98465271, 5000)



usuario1 = Usuario.new("Antonio", [cuenta1,cuenta2])
usuario2 = Usuario.new("Pedro", [cuenta3])



puts cuenta3.saldo
puts cuenta2.saldo

cuenta2.transferir(5000,cuenta1)
puts "despues transferencia"
puts cuenta2.saldo
puts cuenta3.saldo
puts "saldo_total"
puts usuario1.saldo_total