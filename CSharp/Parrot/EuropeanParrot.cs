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