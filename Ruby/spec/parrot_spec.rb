require_relative '../lib/parrot'

describe "Parrots" do
  it "gets speed of a European parrot" do
    parrot = Parrot.new(:european_parrot, 0, 0, false)
    expect(parrot.speed).to eq(12.0)
  end

  it "gets speed of an African parrot with one coconut" do
    parrot = Parrot.new(:african_parrot, 1, 0, false)
    expect(parrot.speed).to eq(3.0)
  end

  it "gets speed of an African parrot with two coconuts" do
    parrot = Parrot.new(:african_parrot, 2, 0, false)
    expect(parrot.speed).to eq(0.0)
  end

  it "gets speed of an African parrot with no coconuts" do
    parrot = Parrot.new(:african_parrot, 0, 0, false)
    expect(parrot.speed).to eq(12.0)
  end

  it "gets speed of a nailed Norwegian blue parrot" do
    parrot = Parrot.new(:norwegian_blue_parrot, 0, 1.5, true)
    expect(parrot.speed).to eq(0.0)
  end

  it "gets speed of a not nailed Norwegian blue parrot" do
    parrot = Parrot.new(:norwegian_blue_parrot, 0, 1.5, false)
    expect(parrot.speed).to eq(18.0)
  end

  it "gets speed of a not nailed Norwegian blue parrot with high voltage" do
    parrot = Parrot.new(:norwegian_blue_parrot, 0, 4, false)
    expect(parrot.speed).to eq(24.0)
  end
end
