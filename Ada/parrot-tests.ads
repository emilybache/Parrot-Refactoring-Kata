with AUnit;            use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;

package Parrot.Tests is

   type Parrot_Test is new Test_Cases.Test_Case with null record;

   procedure Register_Tests (T : in out Parrot_Test);

   function Name (T : Parrot_Test) return Message_String;

end Parrot.Tests;
