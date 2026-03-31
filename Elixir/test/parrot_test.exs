defmodule ParrotTest do
  use ExUnit.Case

  test "speed of european parrot" do
    assert Parrot.speed(:european, 0, 0, false) == 12.0
  end

  test "speed of african parrot with one coconut" do
    assert Parrot.speed(:african, 1, 0, false) == 3.0
  end

  test "speed of african parrot with two coconuts" do
    assert Parrot.speed(:african, 2, 0, false) == 0
  end

  test "speed of african parrot with no coconuts" do
    assert Parrot.speed(:african, 0, 0, false) == 12.0
  end

  test "speed of norwegian blue parrot nailed" do
    assert Parrot.speed(:norwegian_blue, 0, 0, true) == 0
  end

  test "speed of norwegian blue parrot nailed with voltage" do
    assert Parrot.speed(:norwegian_blue, 0, 1.5, true) == 0
  end

  test "speed of norwegian blue parrot not nailed" do
    assert Parrot.speed(:norwegian_blue, 0, 1.5, false) == 18.0
  end

  test "speed of norwegian blue parrot not nailed high voltage" do
    assert Parrot.speed(:norwegian_blue, 0, 4, false) == 24.0
  end

  test "cry of european parrot" do
    assert Parrot.cry(:european, 0, 0, false) == "Sqoork!"
  end

  test "cry of african parrot" do
    assert Parrot.cry(:african, 2, 0, false) == "Sqaark!"
  end

  test "cry of norwegian blue parrot high voltage" do
    assert Parrot.cry(:norwegian_blue, 0, 4, false) == "Bzzzzzz"
  end

  test "cry of norwegian blue parrot no voltage" do
    assert Parrot.cry(:norwegian_blue, 0, 0, false) == "..."
  end
end
