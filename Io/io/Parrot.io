ParrotType := Object clone do(
    EUROPEAN := 1
    AFRICAN := 2
    NORWEGIAN_BLUE := 3
)

Parrot := Object clone do(

    with := method(parrotType, numberOfCoconuts, voltage, isNailed,
        result := self clone
        result parrotType := parrotType
        result numberOfCoconuts := numberOfCoconuts
        result voltage := voltage
        result isNailed := isNailed
        result
    )

    getSpeed := method(
        parrotType switch(
            ParrotType EUROPEAN, getBaseSpeed,
            ParrotType AFRICAN, (getBaseSpeed - getLoadFactor * numberOfCoconuts) max(0),
            ParrotType NORWEGIAN_BLUE, if(isNailed, 0, getBaseSpeedVoltage(voltage))
        )
    )

    getBaseSpeedVoltage := method(voltage,
        (voltage * getBaseSpeed) min(24.0)
    )

    getLoadFactor := 9.0

    getBaseSpeed := 12.0

    getCry := method (
        parrotType switch(
            ParrotType EUROPEAN, "Sqoork!",
            ParrotType AFRICAN, "Sqaark!",
            ParrotType NORWEGIAN_BLUE, if(voltage > 0, "Bzzzzzz", "...")
        )
    )

)
