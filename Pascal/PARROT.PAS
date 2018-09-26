unit Parrot;

interface

type
    TParrotType = (European, African, NorwegianBlue);
    TParrot = object
        ParrotType: TParrotType;
        NumberOfCoconuts: Word;
        Voltage: Double;
        IsNailed: Boolean;

        constructor Init(ParrotTypeIn: TParrotType; NumberOfCoconutsIn: Word; VoltageIn: Double; IsNailedIn: Boolean);
        function GetSpeed: Double;
        { private }
        function GetBaseSpeed: Double;
        function GetLoadFactor: Double;
        function GetBaseSpeedForVoltage(VoltageIn: Double): Double;
    end;
    PParrot = ^TParrot;

implementation

uses Math;

constructor TParrot.Init(ParrotTypeIn: TParrotType; NumberOfCoconutsIn: Word; VoltageIn: Double; IsNailedIn: Boolean);
begin
    Self.ParrotType := ParrotTypeIn;
    Self.NumberOfCoconuts := NumberOfCoconutsIn;
    Self.Voltage := VoltageIn;
    Self.IsNailed := IsNailedIn;
end;

function TParrot.GetBaseSpeed: Double;
begin
    GetBaseSpeed := 12.0;
end;

function TParrot.GetLoadFactor: Double;
begin
    GetLoadFactor := 9.0;
end;

function TParrot.GetBaseSpeedForVoltage(VoltageIn: Double): Double;
begin
    GetBaseSpeedForVoltage := Math.Min(24.0, VoltageIn * Self.GetBaseSpeed);
end;

function TParrot.GetSpeed: Double;
begin
    if Self.ParrotType = European then
    begin
        GetSpeed := Self.GetBaseSpeed;
    end
    else if Self.ParrotType = African then
    begin
        GetSpeed := Math.Max(0.0, Self.GetBaseSpeed - Self.GetLoadFactor * Self.NumberOfCoconuts);
    end
    else if Self.ParrotType = NorwegianBlue then
    begin
        if Self.IsNailed then
        begin
            GetSpeed := 0.0;
        end
        else
        begin
            GetSpeed := Self.GetBaseSpeedForVoltage(Self.Voltage);
        end;
    end
    else
    begin
        WriteLn('Should be unreachable');
        RunError(42);
    end;
end;

end.
