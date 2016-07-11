<?php

namespace Parrot;

class ParrotTest extends \PHPUnit_Framework_TestCase{

  /** @test */
  public function get_speed_of_european_parrot() {
    $parrot = new Parrot(ParrotTypeEnum::EUROPEAN, 0,0, false);
    $this->assertEquals(12.0, $parrot->getSpeed());
  }

  /** @test */
  public function get_speed_of_african_parrot_with_one_coconut() {
    $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 1, 0, false);
    $this->assertEquals(3.0, $parrot->getSpeed());
  }

  /** @test */
  public function get_speed_of_african_parrot_with_two_coconuts() {
    $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 2, 0, false);
    $this->assertEquals(0.0, $parrot->getSpeed());
  }

  /** @test */
  public function get_speed_of_african_parrot_with_no_coconuts() {
    $parrot = new Parrot(ParrotTypeEnum::AFRICAN, 0,0, false);
    $this->assertEquals(12.0, $parrot->getSpeed());
  }

  /** @test */
  public function get_speed_norwegian_blue_parrot_nailed() {
    $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0,0,true);
    $this->assertEquals(0.0, $parrot->getSpeed());
  }

  /** @test */
  public function get_speed_norwegian_blue_parrot_not_nailed() {
  $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0, 1.5, false);
    $this->assertEquals(18.0, $parrot->getSpeed());
  }

  /** @test */
  public function get_speed_norwegian_blue_parrot_not_nailed_high_voltage() {
    $parrot = new Parrot(ParrotTypeEnum::NORWEGIAN_BLUE, 0,4, false);
    $this->assertEquals(24.0, $parrot->getSpeed());
  }
}