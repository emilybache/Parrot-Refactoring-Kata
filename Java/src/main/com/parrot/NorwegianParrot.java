package com.parrot;
public class NorwegianParrot extends Parrot {
    public NorwegianParrot(int numberOfCoconuts, double voltage, boolean isNailed) {
        super(numberOfCoconuts, voltage, isNailed);
    }

    @Override
    public double getSpeed() {
        return  (isNailed) ? 0 : Math.min(MAX_SPEED, voltage * BASE_SPEED );
    }

    @Override
    protected String getCry() {
        return (voltage > 0) ? "Bzzzzzz" : "...";
    }
}
