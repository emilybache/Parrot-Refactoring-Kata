using System;
using System.Collections.Generic;

namespace Parrot
{
    public abstract class Parrot
    {
        protected readonly int _numberOfCoconuts;
        protected readonly ParrotTypeEnum _type;
        protected readonly double _voltage;

        protected Parrot(ParrotTypeEnum type, int numberOfCoconuts, double voltage, bool isNailed)
        {
            _type = type;
            _numberOfCoconuts = numberOfCoconuts;
            _voltage = voltage;
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

        public abstract double GetSpeed();

        protected double GetBaseSpeed(double voltage)
        {
            return Math.Min(24.0, voltage * GetBaseSpeed());
        }

        protected double GetLoadFactor()
        {
            return 9.0;
        }

        protected double GetBaseSpeed()
        {
            return 12.0;
        }

        public abstract string GetCry();
    }
}