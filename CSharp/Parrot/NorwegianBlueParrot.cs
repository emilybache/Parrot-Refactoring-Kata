using System;

namespace Parrot;

public class NorwegianBlueParrot : Parrot
{
    public NorwegianBlueParrot(int numberOfCoconuts, double voltage, bool isNailed) : 
        base(ParrotTypeEnum.NORWEGIAN_BLUE, numberOfCoconuts, voltage, isNailed)
    {
    }

    public override double GetSpeed()
    {
        return _isNailed ? 0 : GetBaseSpeed(_voltage);
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