<?php

namespace Parrot;

use Exception;

class Parrot
{
    /**
     * @var int ParrotTypeEnum
     */
    private $type;
    /**
     * @var int
     */
    private $numberOfCoconuts;
    /**
     * @var float
     */
    private $voltage;
    /**
     * @var bool
     */
    private $isNailed;

    public function __construct($type, $numberOfCoconuts, $voltage, $isNailed)
    {
        $this->type = $type;
        $this->numberOfCoconuts = $numberOfCoconuts;
        $this->voltage = $voltage;
        $this->isNailed = $isNailed;
    }

    public function getSpeed()
    {
        switch ($this->type) {
            case ParrotTypeEnum::EUROPEAN:
                return $this->getBaseSpeed();
            case ParrotTypeEnum::AFRICAN:
                return max(0, $this->getBaseSpeed() - $this->getLoadFactor() * $this->numberOfCoconuts);
            case ParrotTypeEnum::NORWEGIAN_BLUE:
                return $this->isNailed ? 0 : $this->getBaseSpeedWith($this->voltage);
        }
        throw new Exception("Should be unreachable");
    }

    private function getBaseSpeedWith($voltage)
    {
        return min(24.0, $voltage * $this->getBaseSpeed());
    }

    private function getLoadFactor()
    {
        return 9.0;
    }

    private function getBaseSpeed()
    {
        return 12.0;
    }
}
