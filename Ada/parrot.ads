package Parrot is

   type ParrotType is (EUROPEAN, AFRICAN, NORWEGIAN_BLUE);

   type ParrotData is record
      ofType           : ParrotType;
      numberOfCoconuts : Integer;
      voltage          : Float;
      isNailed         : Boolean;
   end record;

   function GetSpeed (parrot : ParrotData) return Float;

end Parrot;
