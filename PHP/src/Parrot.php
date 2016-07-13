<?php

namespace Parrot;

class Parrot {
  /** @var int ParrotTypeEnum */
  private $type;
  /** @var int */
  private $numberOfCoconuts = 0;
  /** @var  double */
  private $voltage;
  /** @var  boolean */
  private $isNailed;

  /**
   * Parrot constructor.
   * @param int $type
   * @param int $numberOfCoconuts
   * @param float $voltage
   * @param bool $isNailed
   */
  public function __construct($type, $numberOfCoconuts, $voltage, $isNailed) {
    $this->type = $type;
    $this->numberOfCoconuts = $numberOfCoconuts;
    $this->voltage = $voltage;
    $this->isNailed = $isNailed;
  }

  /**
   * @return float
   * @throws \Exception
   */
  public function getSpeed() {
    switch ($this->type) {
      case ParrotTypeEnum::EUROPEAN:
        return $this->getBaseSpeed();
      case ParrotTypeEnum::AFRICAN:
        return max(0, $this->getBaseSpeed() - $this->getLoadFactor() * $this->numberOfCoconuts);
      case ParrotTypeEnum::NORWEGIAN_BLUE:
        return $this->isNailed ? 0 : $this->getBaseSpeedWith($this->voltage);
    }
    throw new \Exception("Should be unreachable");
  }

  private function getBaseSpeedWith($voltage) {
    return min(24.0, $voltage * $this->getBaseSpeed());
  }

  private function getLoadFactor() {
    return 9.0;
  }

  private function getBaseSpeed() {
    return 12.0;
  }

}