<?php

declare(strict_types=1);

namespace Parrot\Tests;

use Parrot\Parrot;
use Parrot\ParrotTypeEnum;
use PHPUnit\Framework\TestCase;

class ParrotTest extends TestCase
{
    public function testSpeedOfEuropeanParrot(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::EUROPEAN, 0, 0, false);
        self::assertEquals(12.0, $parrot->getSpeed());
    }

    public function testSpeedOfAfricanParrotWithOneCoconut(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 1, 0, false);
        self::assertEquals(3.0, $parrot->getSpeed());
    }

    public function testSpeedOfAfricanParrotWithTwoCoconuts(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 2, 0, false);
        self::assertEquals(0.0, $parrot->getSpeed());
    }

    public function testSpeedOfAfricanParrotWithNoCoconuts(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 0, 0, false);
        self::assertEquals(12.0, $parrot->getSpeed());
    }

    public function testSpeedNorwegianBlueParrotNailed(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 1.5, true);
        self::assertEquals(0.0, $parrot->getSpeed());
    }

    public function testSpeedNorwegianBlueParrotNotNailed(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 1.5, false);
        self::assertEquals(18.0, $parrot->getSpeed());
    }

    public function testSpeedNorwegianBlueParrotNotNailedHighVoltage(): void
    {
        $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 4, false);
        self::assertEquals(24.0, $parrot->getSpeed());
    }
}
