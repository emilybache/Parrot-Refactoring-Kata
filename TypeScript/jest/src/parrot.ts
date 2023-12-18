export enum ParrotTypes {
    EUROPEAN,
    AFRICAN,
    NORWEGIAN_BLUE,
}

export class Parrot {
    constructor(private parrotType: ParrotTypes,
                private numberOfCoconuts: number,
                private voltage: number,
                private isNailed: boolean) {
    }

    public getSpeed(): number {
        switch (this.parrotType) {
            case ParrotTypes.EUROPEAN:
                return this.getBaseSpeed();
            case ParrotTypes.AFRICAN:
                return Math.max(0, this.getBaseSpeed() - this.getLoadFactor() * this.numberOfCoconuts);
            case ParrotTypes.NORWEGIAN_BLUE:
                return (this.isNailed) ? 0 : this.getBaseSpeedWithVoltage(this.voltage);
        }
        throw new Error("Should be unreachable");
    }

    private getBaseSpeed(): number {
        return 12;
    }

    private getLoadFactor(): number {
        return 9;
    }

    private getBaseSpeedWithVoltage(voltage: number): number {
        return Math.min(24, voltage * this.getBaseSpeed());
    }

    public getCry(): String {
        switch (this.parrotType) {
            case ParrotTypes.EUROPEAN:
                return "Sqoork!";
            case ParrotTypes.AFRICAN:
                return "Sqaark!";
            case ParrotTypes.NORWEGIAN_BLUE:
                return this.voltage > 0 ? "Bzzzzzz" : "...";
        }
        throw new Error("Should be unreachable");
    }

}
