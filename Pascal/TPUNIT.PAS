{F+} { need to set Far Calls in Compiler Options too }
(* ------------------------------------------------------------------ *)
(* Minimalist xUnit implementation for Turbo Pascal in TP style.      *)
(* Version: 2.10                                                      *)
(* Language: Turbo Pascal 6.01                                        *)
(* Copyright: (c) 2010 Peter Kofler, www.code-cop.org                 *)
(* License: BSD, http://www.opensource.org/licenses/bsd-license.php   *)
(* ------------------------------------------------------------------ *)
unit TPUnit;

interface

{
  uses TPUnit;

  Tests are added as methods without arguments to the test
  program as usual and use asserts provided by the unit.
  The first failed assertion stops program execution.

  procedure TestAddition;
  begin
      AssertEqualsInt('use asserts in tests', 2, 1 + 1);
  end;

  Due to the lack of introspection each test has to
  be called manually in the main body.

  begin
      RunTest('TestAddition', TestAddition);
  end.
}

type
    TestMethod = procedure;

{ Asserts }
procedure AssertEqualsInt(Message: string; Expected, Actual: Longint);
procedure AssertEqualsStr(Message: string; Expected, Actual: string);
procedure AssertEqualsDouble(Message: string; Expected, Actual, Delta: Double);
procedure AssertNotNil(Message: string; Actual: Pointer);
procedure AssertNil(Message: string; Actual: Pointer);
procedure AssertTrue(Message: string; Actual: Boolean);
procedure AssertFalse(Message: string; Actual: Boolean);
procedure Fail(Message: string);

{ Test Runner }
procedure RunTest(Name: string; Test: TestMethod);
procedure RunFixtures(Name: string; SetUp, Test, TearDown: TestMethod);
procedure Empty;

implementation

uses Crt;

procedure FailExpectedActual(Message, Expected, Actual: string);
begin
    if Message = '' then
    begin
        Fail(Concat('Expected ', Expected, ' but was ', Actual));
    end
    else
    begin
        Fail(Concat(Message, ' Expected ', Expected, ' but was ', Actual));
    end;
end;

procedure AssertEqualsInt(Message: string; Expected, Actual: Longint);
var ExpectedStr, ActualStr: string;
begin
    if Expected <> Actual then
    begin
        Str(Expected, ExpectedStr);
        Str(Actual, ActualStr);
        FailExpectedActual(Message, ExpectedStr, ActualStr);
    end;
end;

procedure AssertEqualsStr(Message: string; Expected, Actual: string);
begin
    if Expected <> Actual then
    begin
        FailExpectedActual(Message, Expected, Actual);
    end;
end;

procedure AssertEqualsDouble(Message: string; Expected, Actual, Delta: Double);
var ExpectedStr, ActualStr: string;
begin
    if Abs(Expected - Actual) >= Delta then
    begin
        Str(Expected, ExpectedStr);
        Str(Actual, ActualStr);
        FailExpectedActual(Message, ExpectedStr, ActualStr);
    end;
end;

procedure AssertNotNil(Message: string; Actual: Pointer);
begin
    if Actual = nil then
    begin
        FailExpectedActual(Message, 'not nil', 'nil');
    end;
end;

procedure AssertNil(Message: string; Actual: Pointer);
begin
    if Actual <> nil then
    begin
        FailExpectedActual(Message, 'nil', 'not nil');
    end;
end;

procedure AssertTrue(Message: string; Actual: Boolean);
begin
    if not Actual then
    begin
        FailExpectedActual(Message, 'true', 'false');
    end;
end;

procedure AssertFalse(Message: string; Actual: Boolean);
begin
    if Actual then
    begin
        FailExpectedActual(Message, 'false', 'true');
    end;
end;

procedure Fail(Message: string);
begin
    Crt.TextColor(Red);
    WriteLn(' - FAILED');
    Crt.NormVideo;
    WriteLn(Message);

    Halt(1);
end;

procedure Empty;
begin
end;

procedure RunTest(Name: string; Test: TestMethod);
begin
    RunFixtures(Name, Empty, Test, Empty);
end;

procedure RunFixtures(Name: string; SetUp, Test, TearDown: TestMethod);
begin
    Write('TEST ', Name);
    SetUp;
    Test;
    TearDown;

    Crt.TextColor(Green);
    WriteLn(' - OK');
    Crt.NormVideo;
end;

begin
    Crt.ClrScr;
end.
