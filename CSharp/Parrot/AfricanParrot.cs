using System;

namespace Parrot;

public class AfricanParrot : Parrot
{
    public AfricanParrot(int numberOfCoconuts, double voltage) : 
        base(ParrotTypeEnum.AFRICAN, numberOfCoconuts, voltage)
    {
            
    }

    public override double GetSpeed()
    {
        return Math.Max(0, GetBaseSpeed() - GetLoadFactor() * _numberOfCoconuts);
    }

    public override string GetCry()
    {
        return "Sqaark!";
    }
}