using System;

namespace Parrot;

public class EuropeanParrot : Parrot
{
    public EuropeanParrot() : 
        base(ParrotTypeEnum.EUROPEAN)
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