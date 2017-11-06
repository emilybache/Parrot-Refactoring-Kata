package parrot

import parrot.ParrotType._

class Parrot(parrotType: ParrotType, numberOfCoconuts: Int, voltage: Double, isNailed: Boolean) {

  def getSpeed: Double = {
    parrotType match {
      case EUROPEAN =>
        return getBaseSpeed
      case AFRICAN =>
        return Math.max(0, getBaseSpeed - getLoadFactor * numberOfCoconuts)
      case NORWEGIAN_BLUE =>
        return if ((isNailed)) 0 else getBaseSpeed(voltage)
    }
    throw new RuntimeException("Should be unreachable")
  }

  private def getBaseSpeed(voltage: Double): Double = {
    return Math.min(24.0, voltage * getBaseSpeed)
  }

  private def getLoadFactor: Double = {
    return 9.0
  }

  private def getBaseSpeed: Double = {
    return 12.0
  }

}
