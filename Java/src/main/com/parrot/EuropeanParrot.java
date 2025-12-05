package com.parrot;

public class EuropeanParrot  extends Parrot {
    public EuropeanParrot( int numberOfCoconuts, double voltage, boolean isNailed) {
        super(numberOfCoconuts, voltage, isNailed);
    }
    @Override
    public double getSpeed() {
        return BASE_SPEED;
    }

    @Override
    protected String getCry() {
        return "Sqoork!";
    }
}
