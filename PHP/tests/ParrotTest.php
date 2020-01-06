<?php

namespace Tests;

use Parrot\Parrot;
use Parrot\ParrotTypeEnum;
use PHPUnit\Framework\TestCase;

class ParrotTest extends TestCase
{

    /** @test */
    public function getSpeedOfEuropeanParrot()
    {
        $parrot = new Parrot(ParrotTypeEnum::EUROPEAN, 0, 0, false);
        $this->assertEquals(12.0, $parrot->getSpeed());
    }

    /** @test */
    public function getSpeedOfAfricanParrotWithOneCoconut()
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 1, 0, false);
        $this->assertEquals(3.0, $parrot->getSpeed());
    }

    /** @test */
    public function getSpeedOfAfricanParrotWithTwoCoconuts()
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 2, 0, false);
        $this->assertEquals(0.0, $parrot->getSpeed());
    }

    /** @test */
    public function getSpeedOfAfricanParrotWithNoCoconuts()
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 0, 0, false);
        $this->assertEquals(12.0, $parrot->getSpeed());
    }

    /** @test */
    public function getSpeedNorwegianBlueParrotNailed()
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 1.5, true);
        $this->assertEquals(0.0, $parrot->getSpeed());
    }

    /** @test */
    public function getSpeedNorwegianBlueParrotNotNailed()
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 1.5, false);
        $this->assertEquals(18.0, $parrot->getSpeed());
    }

    /** @test */
    public function getSpeedNorwegianBlueParrotNotNailedHighVoltage()
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 4, false);
        $this->assertEquals(24.0, $parrot->getSpeed());
    }
}
