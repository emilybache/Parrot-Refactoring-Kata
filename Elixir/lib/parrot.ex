defmodule Parrot do
  def speed(type, number_of_coconuts, voltage, is_nailed) do
    case type do
      :european ->
        base_speed()

      :african ->
        max(0, base_speed() - load_factor() * number_of_coconuts)

      :norwegian_blue ->
        if is_nailed, do: 0, else: base_speed_with_voltage(voltage)

      _ ->
        raise "Unknown parrot type"
    end
  end

  def cry(type, _number_of_coconuts, voltage, _is_nailed) do
    case type do
      :european ->
        "Sqoork!"

      :african ->
        "Sqaark!"

      :norwegian_blue ->
        if voltage > 0, do: "Bzzzzzz", else: "..."

      _ ->
        raise "Unknown parrot type"
    end
  end

  defp base_speed, do: 12.0

  defp load_factor, do: 9.0

  defp base_speed_with_voltage(voltage) do
    min(24.0, voltage * base_speed())
  end
end
