package body Parrot is

    function GetBaseSpeed return Float is
    begin
        return 12.0;
    end GetBaseSpeed;

    function GetLoadFactor return Float is
    begin
        return 9.0;
    end GetLoadFactor;

    function GetBaseSpeedForVoltage (voltage : Float) return Float is
    begin
        return Float'Min (24.0, voltage * GetBaseSpeed);
    end getBaseSpeedForVoltage;

    function GetSpeed (parrot : ParrotData) return Float is
    begin
        case parrot.ofType is
            when EUROPEAN =>
                return GetBaseSpeed;
            when AFRICAN =>
                return Float'Max (0.0, GetBaseSpeed - GetLoadFactor * Float (parrot.numberOfCoconuts));
            when NORWEGIAN_BLUE =>
                if parrot.isNailed then
                    return 0.0;
                else
                    return GetBaseSpeedForVoltage (parrot.voltage);
                end if;
        end case;
    end GetSpeed;

end Parrot;
