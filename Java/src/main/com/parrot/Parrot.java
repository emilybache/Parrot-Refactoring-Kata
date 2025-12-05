package com.parrot;

public abstract class Parrot {
    protected final int numberOfCoconuts;
    protected final double voltage;
    protected final boolean isNailed;

    protected Parrot( int numberOfCoconuts, double voltage, boolean isNailed) {
        this.numberOfCoconuts = numberOfCoconuts;
        this.voltage = voltage;
        this.isNailed = isNailed;
    }
    protected static final double BASE_SPEED = 12.0;
    protected static final double MAX_SPEED = 24.0;
    protected static final double LOAD_FACTOR = 9.0;

    public abstract double getSpeed();

    protected abstract String getCry();


}
