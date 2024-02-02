using System;

namespace Parrot;

public class NorwegianBlueParrot : Parrot
{
    protected bool _isNailed;
    protected double _voltage;

    public NorwegianBlueParrot(double voltage, bool isNailed) : 
        base()
    {
        _isNailed = isNailed;
        _voltage = voltage;
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