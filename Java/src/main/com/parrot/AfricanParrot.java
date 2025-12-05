package com.parrot;

public class AfricanParrot extends Parrot {

    public AfricanParrot(int numberOfCoconuts, double voltage, boolean isNailed) {
        super( numberOfCoconuts, voltage, isNailed);
    }

    @Override
    public double getSpeed() {
        return Math.max(0, BASE_SPEED - LOAD_FACTOR * numberOfCoconuts );
    }

    @Override
    protected String getCry() {
        return "Sqaark!";
    }
}
