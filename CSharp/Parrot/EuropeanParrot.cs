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
        switch (_type)
        {
            case ParrotTypeEnum.EUROPEAN:
                return GetBaseSpeed();
            case ParrotTypeEnum.AFRICAN:
                return Math.Max(0, GetBaseSpeed() - GetLoadFactor() * _numberOfCoconuts);
            case ParrotTypeEnum.NORWEGIAN_BLUE:
                return _isNailed ? 0 : GetBaseSpeed(_voltage);
            default:
                throw new ArgumentOutOfRangeException();
        }
    }
}