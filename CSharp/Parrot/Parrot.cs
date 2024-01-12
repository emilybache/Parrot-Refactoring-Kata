using System;
using System.Collections.Generic;

namespace Parrot
{
    public class Parrot
    {
        private readonly bool _isNailed;
        private readonly int _numberOfCoconuts;
        private readonly ParrotTypeEnum _type;
        private readonly double _voltage;

        protected Parrot(ParrotTypeEnum type, int numberOfCoconuts, double voltage, bool isNailed)
        {
            _type = type;
            _numberOfCoconuts = numberOfCoconuts;
            _voltage = voltage;
            _isNailed = isNailed;
        }

        public static Parrot CreateParrot(ParrotTypeEnum type, int numberOfCoconuts, double voltage, bool isNailed)
        {
            Parrot parrot;
            switch (type)
            {
                case ParrotTypeEnum.EUROPEAN:
                    parrot = new EuropeanParrot(numberOfCoconuts, voltage, isNailed);
                    break;
                case ParrotTypeEnum.AFRICAN:
                    parrot = new AfricanParrot(numberOfCoconuts, voltage, isNailed);
                    break;
                case ParrotTypeEnum.NORWEGIAN_BLUE:
                    parrot = new NorwegianBlueParrot(numberOfCoconuts, voltage, isNailed);
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(type), type, null);
            }

            return parrot;
        }

        public double GetSpeed()
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

        private double GetBaseSpeed(double voltage)
        {
            return Math.Min(24.0, voltage * GetBaseSpeed());
        }

        private double GetLoadFactor()
        {
            return 9.0;
        }

        private double GetBaseSpeed()
        {
            return 12.0;
        }

        public string GetCry()
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
}