with AUnit.Test_Cases; use AUnit.Test_Cases;
with AUnit.Assertions; use AUnit.Assertions;
with GNAT.Source_Info;

package body Parrot.Tests is

   -- Custom assert for Float
   procedure Assert (Expected, Actual, Diff : Float; --
                     Message                : String;
                     Source                 : String  := GNAT.Source_Info.File;
                     Line                   : Natural := GNAT.Source_Info.Line)
   is
   begin
      Assert (abs (Actual - Expected) <= Diff, Message, Source, Line);
   end Assert;

   procedure Test_Speed_Of_European_Parrot (T : in out Test_Cases.Test_Case'Class)
   is
      Parrot : ParrotData := (ofType => EUROPEAN, numberOfCoconuts => 0, voltage => 0.0, isNailed => False);
   begin
      Assert (Expected => 12.0, Actual => GetSpeed (Parrot), Diff => 0.0, Message => "speed");
   end Test_Speed_Of_European_Parrot;

   procedure Test_Speed_Of_African_Parrot_With_One_Coconut (T : in out Test_Cases.Test_Case'Class)
   is
      Parrot : ParrotData := (ofType => AFRICAN, numberOfCoconuts => 1, voltage => 0.0, isNailed => False);
   begin
      Assert (Expected => 3.0, Actual => GetSpeed (Parrot), Diff => 0.0, Message => "speed");
   end Test_Speed_Of_African_Parrot_With_One_Coconut;

   procedure Test_Speed_Of_African_Parrot_With_Two_Coconuts (T : in out Test_Cases.Test_Case'Class)
   is
      Parrot : ParrotData := (ofType => AFRICAN, numberOfCoconuts => 2, voltage => 0.0, isNailed => False);
   begin
      Assert (Expected => 0.0, Actual => GetSpeed (Parrot), Diff => 0.0, Message => "speed");
   end Test_Speed_Of_African_Parrot_With_Two_Coconuts;

   procedure Test_Speed_Of_African_Parrot_With_No_Coconuts (T : in out Test_Cases.Test_Case'Class)
   is
      Parrot : ParrotData := (ofType => AFRICAN, numberOfCoconuts => 0, voltage => 0.0, isNailed => False);
   begin
      Assert (Expected => 12.0, Actual => GetSpeed (Parrot), Diff => 0.0, Message => "speed");
   end Test_Speed_Of_African_Parrot_With_No_Coconuts;

   procedure Test_Speed_Norwegian_Blue_Parrot_Nailed (T : in out Test_Cases.Test_Case'Class)
   is
      Parrot : ParrotData := (ofType => NORWEGIAN_BLUE, numberOfCoconuts => 0, voltage => 1.5, isNailed => True);
   begin
      Assert (Expected => 0.0, Actual => GetSpeed (Parrot), Diff => 0.0, Message => "speed");
   end Test_Speed_Norwegian_Blue_Parrot_Nailed;

   procedure Test_Speed_Norwegian_Blue_Parrot_Not_Nailed (T : in out Test_Cases.Test_Case'Class)
   is
      Parrot : ParrotData := (ofType => NORWEGIAN_BLUE, numberOfCoconuts => 0, voltage => 1.5, isNailed => False);
   begin
      Assert (Expected => 18.0, Actual => GetSpeed (Parrot), Diff => 0.0, Message => "speed");
   end Test_Speed_Norwegian_Blue_Parrot_Not_Nailed;

   procedure Test_Speed_Norwegian_Blue_Parrot_Not_Nailed_High_Voltage (T : in out Test_Cases.Test_Case'Class)
   is
      Parrot : ParrotData := (ofType => NORWEGIAN_BLUE, numberOfCoconuts => 0, voltage => 4.0, isNailed => False);
   begin
      Assert (Expected => 24.0, Actual => GetSpeed (Parrot), Diff => 0.0, Message => "speed");
   end Test_Speed_Norwegian_Blue_Parrot_Not_Nailed_High_Voltage;

   procedure Register_Tests (T : in out Parrot_Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Speed_Of_European_Parrot'Access, "Speed Of European Parrot");
      Register_Routine (T, Test_Speed_Of_African_Parrot_With_One_Coconut'Access, "Speed Of African Parrot With One Coconut");
      Register_Routine (T, Test_Speed_Of_African_Parrot_With_Two_Coconuts'Access, "Speed Of African Parrot With Two Coconuts");
      Register_Routine (T, Test_Speed_Of_African_Parrot_With_No_Coconuts'Access, "Speed Of African Parrot With No Coconuts");
      Register_Routine (T, Test_Speed_Norwegian_Blue_Parrot_Nailed'Access, "Speed Of Norwegian Blue Parrot Nailed");
      Register_Routine (T, Test_Speed_Norwegian_Blue_Parrot_Not_Nailed'Access, "Speed Of Norwegian Blue Parrot Not Nailed");
      Register_Routine (T, Test_Speed_Norwegian_Blue_Parrot_Not_Nailed_High_Voltage'Access, "Speed Of Norwegian Blue Parrot High Voltage");
   end Register_Tests;

   function Name (T : Parrot_Test) return Message_String is
   begin
      return Format ("Parrot Tests");
   end Name;

end Parrot.Tests;
