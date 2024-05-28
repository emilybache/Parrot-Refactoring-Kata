using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Parrot
{
    public class NorwegianParrot
    {
        private bool IsNailed;
        private double Voltage;

        public NorwegianParrot(double voltage, bool isNailed)
        {
            IsNailed = isNailed;
            Voltage = voltage;
        }

        public double GetSpeed()
        {
            return IsNailed ? 0 : Math.Min(24.0, Voltage * NewParrot.BaseSpeed);
        }

        public string GetCry()
        {
            return Voltage > 0 ? "Bzzzzzz" : "...";
        }
    }
}