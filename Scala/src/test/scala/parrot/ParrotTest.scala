package parrot

import org.scalatest.matchers.should.Matchers
import org.scalatest.flatspec.AnyFlatSpec

class ParrotTest extends AnyFlatSpec with Matchers {

  it should "getSpeedOfEuropeanParrot" in {
    val parrot = new Parrot(ParrotType.EUROPEAN, 0, 0, false)
    parrot.getSpeed shouldEqual 12.0
  }

  it should "getSpeedOfAfricanParrot_With_One_Coconut" in {
    val parrot = new Parrot(ParrotType.AFRICAN, 1, 0, false)
    parrot.getSpeed shouldEqual 3.0
  }

  it should "getSpeedOfAfricanParrot_With_Two_Coconuts" in {
    val parrot = new Parrot(ParrotType.AFRICAN, 2, 0, false)
    parrot.getSpeed shouldEqual 0.0
  }

  it should "getSpeedOfAfricanParrot_With_No_Coconuts" in {
    val parrot = new Parrot(ParrotType.AFRICAN, 0, 0, false)
    parrot.getSpeed shouldEqual 12.0
  }

  it should "getSpeedNorwegianBlueParrot_nailed" in {
    val parrot = new Parrot(ParrotType.NORWEGIAN_BLUE, 0, 1.5, true)
    parrot.getSpeed shouldEqual 0.0;
  }

  it should "getSpeedNorwegianBlueParrot_not_nailed" in {
    val parrot = new Parrot(ParrotType.NORWEGIAN_BLUE, 0, 1.5, false)
    parrot.getSpeed shouldEqual 18.0
  }

  it should "getSpeedNorwegianBlueParrot_not_nailed_high_voltage" in {
    val parrot = new Parrot(ParrotType.NORWEGIAN_BLUE, 0, 4, false)
    parrot.getSpeed shouldEqual 24.0
  }

}
