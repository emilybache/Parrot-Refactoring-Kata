export const PARROT_TYPES = {
    EUROPEAN:       'EUROPEAN',
    AFRICAN:        'AFRICAN',
    NORWEGIAN_BLUE: 'NORWEGIAN_BLUE',
};

export class Parrot {
    constructor(type, numberOfCoconuts, voltage, isNailed) {
        this.type = type;
        this.numberOfCoconuts = numberOfCoconuts;
        this.voltage = voltage;
        this.isNailed = isNailed;
    }

    getSpeed() {
        switch (this.type) {
            case PARROT_TYPES.EUROPEAN:
                return this.getBaseSpeed();
            case PARROT_TYPES.AFRICAN:
                return Math.max(0, this.getBaseSpeed() - this.getLoadFactor() * this.numberOfCoconuts);
            case PARROT_TYPES.NORWEGIAN_BLUE:
                return (this.isNailed) ? 0 : this.getBaseSpeedWithVoltage(this.voltage);
        }
        throw new Error("Should be unreachable");
    }

    getBaseSpeedWithVoltage(voltage) {
        return Math.min(24, voltage * this.getBaseSpeed());
    }

    getLoadFactor() {
        return 9;
    }

    getBaseSpeed() {
        return 12;
    }

    getCry() {
        switch (this.type) {
            case PARROT_TYPES.EUROPEAN:
                return "Sqoork!";
            case PARROT_TYPES.AFRICAN:
                return "Sqaark!";
            case PARROT_TYPES.NORWEGIAN_BLUE:
                return this.voltage > 0 ? "Bzzzzzz" : "...";
        }
        throw new Error("Should be unreachable");
    }
}
