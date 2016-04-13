using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace parrot
{
    [TestClass]
    public class ParrotTest
    {
        [TestMethod]
        public void GetSpeedOfEuropeanParrot()
        {
            Parrot parrot = new Parrot(ParrotTypeEnum.EUROPEAN, 0, 0, false);
            Assert.AreEqual(12.0, parrot.GetSpeed());
        }

        [TestMethod]
        public void GetSpeedOfAfricanParrot_With_One_Coconut()
        {
            Parrot parrot = new Parrot(ParrotTypeEnum.AFRICAN, 1, 0, false);
            Assert.AreEqual(3.0, parrot.GetSpeed());
        }

        [TestMethod]
        public void GetSpeedOfAfricanParrot_With_Two_Coconuts()
        {
            Parrot parrot = new Parrot(ParrotTypeEnum.AFRICAN, 2, 0, false);
            Assert.AreEqual(0.0, parrot.GetSpeed());
        }

        [TestMethod]
        public void GetSpeedOfAfricanParrot_With_No_Coconuts()
        {
            Parrot parrot = new Parrot(ParrotTypeEnum.AFRICAN, 0, 0, false);
            Assert.AreEqual(12.0, parrot.GetSpeed());
        }

        [TestMethod]
        public void GetSpeedNorwegianBlueParrot_nailed()
        {
            Parrot parrot = new Parrot(ParrotTypeEnum.NORWEGIAN_BLUE, 0, 0, true);
            Assert.AreEqual(0.0, parrot.GetSpeed());
        }

        [TestMethod]
        public void GetSpeedNorwegianBlueParrot_not_nailed()
        {
            Parrot parrot = new Parrot(ParrotTypeEnum.NORWEGIAN_BLUE, 0, 1.5, false);
            Assert.AreEqual(18.0, parrot.GetSpeed());
        }

        [TestMethod]
        public void GetSpeedNorwegianBlueParrot_not_nailed_high_voltage()
        {
            Parrot parrot = new Parrot(ParrotTypeEnum.NORWEGIAN_BLUE, 0, 4, false);
            Assert.AreEqual(24.0, parrot.GetSpeed());
        }
    }
}
