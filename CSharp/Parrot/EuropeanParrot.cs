using System;

namespace Parrot;

public class EuropeanParrot : Parrot
{
    public EuropeanParrot(int numberOfCoconuts, double voltage, bool isNailed) : 
        base(ParrotTypeEnum.EUROPEAN, numberOfCoconuts, voltage, isNailed)
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