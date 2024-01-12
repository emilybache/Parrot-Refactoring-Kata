using System;

namespace Parrot;

public class EuropeanParrot : Parrot
{
    public EuropeanParrot(int numberOfCoconuts, double voltage) : 
        base(ParrotTypeEnum.EUROPEAN, numberOfCoconuts, voltage)
    {
            
    }

    public override double GetSpeed()
    {
        return GetBaseSpeed();
    }

    public override string GetCry()
    {
        return "Sqoork!";
    }
}