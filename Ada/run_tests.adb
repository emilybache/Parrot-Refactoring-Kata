with AUnit.Reporter.Text;
with AUnit.Run;
with AUnit.Simple_Test_Cases; use AUnit.Simple_Test_Cases;
with AUnit.Test_Suites; use AUnit.Test_Suites;

with Parrot.Tests;

procedure Run_Tests is

   function Collect_Tests return Access_Test_Suite is
      Suite : constant Access_Test_Suite := new Test_Suite;
   begin
      Suite.Add_Test (Test_Case_Access'(new Parrot.Tests.Parrot_Test));
      return Suite;
   end Collect_Tests;

   procedure Runner is new AUnit.Run.Test_Runner (Collect_Tests);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Run_Tests;
