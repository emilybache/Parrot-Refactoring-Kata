using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;

namespace Parrot
{
    public class AfricanParrot
    {
        private static double LoadFactor = 9.0;
        private int NumberOfCoconuts;

        public AfricanParrot(int numberOfCoconuts)
        {
            this.NumberOfCoconuts = numberOfCoconuts;
        }

        public double GetSpeed()
        {
            return Math.Max(0, NewParrot.BaseSpeed - LoadFactor * NumberOfCoconuts);
        }

        public string GetCry()
        {
            return "Sqaark!";
        }
        
    }
}
