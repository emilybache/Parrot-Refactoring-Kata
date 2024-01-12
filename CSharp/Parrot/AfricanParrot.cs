using System;

namespace Parrot;

public class AfricanParrot : Parrot
{
    public AfricanParrot(int numberOfCoconuts, double voltage, bool isNailed) : 
        base(ParrotTypeEnum.AFRICAN, numberOfCoconuts, voltage, isNailed)
    {
            
    }

    public override double GetSpeed()
    {
        return Math.Max(0, GetBaseSpeed() - GetLoadFactor() * _numberOfCoconuts);
    }

    public override string GetCry()
    {
        string value;
        switch (_type)
        {
            case ParrotTypeEnum.EUROPEAN:
                value = "Sqoork!";
                break;
            case ParrotTypeEnum.AFRICAN:
                value = "Sqaark!";
                break;
            case ParrotTypeEnum.NORWEGIAN_BLUE:
                value = _voltage > 0 ? "Bzzzzzz" : "...";
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
        return value;
    }
}