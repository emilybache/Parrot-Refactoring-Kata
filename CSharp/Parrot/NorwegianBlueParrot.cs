using System;

namespace Parrot;

public class NorwegianBlueParrot : Parrot
{
    protected bool _isNailed;

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
        return _voltage > 0 ? "Bzzzzzz" : "...";
    }
}