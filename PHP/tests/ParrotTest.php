<?php

declare(strict_types=1);

namespace Tests;

use Parrot\Parrot;
use Parrot\ParrotTypeEnum;
use PHPUnit\Framework\TestCase;

class ParrotTest extends TestCase
{
    public function testGetSpeedOfEuropeanParrot(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::EUROPEAN, 0, 0, false);
        $this->assertSame(12.0, $parrot->getSpeed());
    }

    public function testGetSpeedOfAfricanParrotWithOneCoconut(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 1, 0, false);
        $this->assertSame(3.0, $parrot->getSpeed());
    }

    public function testGetSpeedOfAfricanParrotWithTwoCoconuts(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 2, 0, false);
        $this->assertSame(0.0, $parrot->getSpeed());
    }

    public function testGetSpeedOfAfricanParrotWithNoCoconuts(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 0, 0, false);
        $this->assertSame(12.0, $parrot->getSpeed());
    }

    public function testGetSpeedNorwegianBlueParrotNailed(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 1.5, true);
        $this->assertSame(0.0, $parrot->getSpeed());
    }

    public function testGetSpeedNorwegianBlueParrotNotNailed(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 1.5, false);
        $this->assertSame(18.0, $parrot->getSpeed());
    }

    public function testGetSpeedNorwegianBlueParrotNotNailedHighVoltage(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 4, false);
        $this->assertSame(24.0, $parrot->getSpeed());
    }

    public function testAnUnknownParrotWillWillThrownAnException(): void
    {
        $this->expectExceptionMessage('Should be unreachable');
        $fakeParrot = new Parrot(-1, 0, 0, false);
        $fakeParrot->getSpeed();
    }
}
