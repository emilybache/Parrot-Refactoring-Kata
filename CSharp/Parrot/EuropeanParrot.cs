using System;

namespace Parrot;

public class EuropeanParrot : Parrot
{
    public EuropeanParrot(double voltage) : 
        base(ParrotTypeEnum.EUROPEAN, voltage)
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