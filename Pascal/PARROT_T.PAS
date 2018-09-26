{F+} { need to set Far Calls in Compiler Options too }
program Parrot_T;

uses TPUnit, Parrot;

const AllowRoundingError = 1E-16;

var P: PParrot;

procedure Cleanup;
begin
    if P <> nil then
    begin
        Dispose(P);
        P := nil;
    end;
end;

procedure GetSpeedOfEuropeanParrot;
begin
    P := New(PParrot, Init(European, 0, 0, False));
    AssertEqualsDouble('Speed', 12.0, P^.GetSpeed, AllowRoundingError);
end;

procedure GetSpeedOfAfricanParrotWithOneCoconut;
begin
    P := New(PParrot, Init(African, 1, 0, False));
    AssertEqualsDouble('Speed', 3.0, P^.GetSpeed, AllowRoundingError);
end;

procedure GetSpeedOfAfricanParrotWithTwoCoconuts;
begin
    P := New(PParrot, Init(African, 2, 0, False));
    AssertEqualsDouble('Speed', 0.0, P^.GetSpeed, AllowRoundingError);
end;

procedure GetSpeedOfAfricanParrotWithNoCoconuts;
begin
    P := New(PParrot, Init(African, 0, 0, False));
    AssertEqualsDouble('Speed', 12.0, P^.GetSpeed, AllowRoundingError);
end;

procedure GetSpeedNorwegianBlueParrotNailed;
begin
    P := New(PParrot, Init(NorwegianBlue, 0, 1.5, True));
    AssertEqualsDouble('Speed', 0.0, P^.GetSpeed, AllowRoundingError);
end;

procedure GetSpeedNorwegianBlueParrotNotNailed;
begin
    P := New(PParrot, Init(NorwegianBlue, 0, 1.5, False));
    AssertEqualsDouble('Speed', 18.0, P^.GetSpeed, AllowRoundingError);
end;

procedure GetSpeedNorwegianBlueParrotHighVoltage;
begin
    P := New(PParrot, Init(NorwegianBlue, 0, 4, False));
    AssertEqualsDouble('Speed', 24.0, P^.GetSpeed, AllowRoundingError);
end;

begin
    RunFixtures('GetSpeedOfEuropeanParrot', Empty, GetSpeedOfEuropeanParrot, Cleanup);
    RunFixtures('GetSpeedOfAfricanParrotWithOneCoconut', Empty, GetSpeedOfAfricanParrotWithOneCoconut, Cleanup);
    RunFixtures('GetSpeedOfAfricanParrotWithTwoCoconuts', Empty, GetSpeedOfAfricanParrotWithTwoCoconuts, Cleanup);
    RunFixtures('GetSpeedOfAfricanParrotWithNoCoconuts', Empty, GetSpeedOfAfricanParrotWithNoCoconuts, Cleanup);
    RunFixtures('GetSpeedNorwegianBlueParrotNailed', Empty, GetSpeedNorwegianBlueParrotNailed, Cleanup);
    RunFixtures('GetSpeedNorwegianBlueParrotNotNailed', Empty, GetSpeedNorwegianBlueParrotNotNailed, Cleanup);
    RunFixtures('GetSpeedNorwegianBlueParrotNotNailedHighVoltage', Empty, GetSpeedNorwegianBlueParrotHighVoltage, Cleanup);
end.
