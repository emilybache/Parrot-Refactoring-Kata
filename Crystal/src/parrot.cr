class Parrot
  def initialize(type : Symbol, number_of_coconuts : Int32, voltage : Float32, nailed : Bool)
    @type = type
    @number_of_coconuts = number_of_coconuts
    @voltage = voltage
    @nailed = nailed
  end

  def speed
    case @type
    when :european_parrot
      return base_speed
    when :african_parrot
      return [0, base_speed - load_factor * @number_of_coconuts].max
    when :norwegian_blue_parrot
      return (@nailed) ? 0 : compute_base_speed_for_voltage(@voltage)
    end

    raise "Should be unreachable!"
  end

  private def compute_base_speed_for_voltage(voltage)
    [24.0, voltage * base_speed].min
  end

  private def load_factor
    9.0
  end

  private def base_speed
    12.0
  end
end
