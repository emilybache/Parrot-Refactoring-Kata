package parrot

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSpeedOfEuropeanParrot(t *testing.T) {
	parrot := CreateParrot(TypeEuropean, 0, 0, false)
	speed, err := parrot.Speed()
	assert.Equal(t, 12.0, speed)
	assert.NoError(t, err)
}

func TestSpeedOfAfricanParrot_With_One_Coconut(t *testing.T) {
	parrot := CreateParrot(TypeAfrican, 1, 0, false)
	speed, err := parrot.Speed()
	assert.Equal(t, 3.0, speed)
	assert.NoError(t, err)
}

func TestSpeedOfAfricanParrot_With_Two_Coconuts(t *testing.T) {
	parrot := CreateParrot(TypeAfrican, 2, 0, false)
	speed, err := parrot.Speed()
	assert.Equal(t, 0.0, speed)
	assert.NoError(t, err)
}

func TestSpeedOfAfricanParrot_With_No_Coconuts(t *testing.T) {
	parrot := CreateParrot(TypeAfrican, 0, 0, false)
	speed, err := parrot.Speed()
	assert.Equal(t, 12.0, speed)
	assert.NoError(t, err)
}

func TestSpeedNorwegianBlueParrot_nailed(t *testing.T) {
	parrot := CreateParrot(TypeNorwegianBlue, 0, 1.5, true)
	speed, err := parrot.Speed()
	assert.Equal(t, 0.0, speed)
	assert.NoError(t, err)
}

func TestSpeedNorwegianBlueParrot_not_nailed(t *testing.T) {
	parrot := CreateParrot(TypeNorwegianBlue, 0, 1.5, false)
	speed, err := parrot.Speed()
	assert.Equal(t, 18.0, speed)
	assert.NoError(t, err)
}

func TestSpeedNorwegianBlueParrot_not_nailed_high_voltage(t *testing.T) {
	parrot := CreateParrot(TypeNorwegianBlue, 0, 4, false)
	speed, err := parrot.Speed()
	assert.Equal(t, 24.0, speed)
	assert.NoError(t, err)
}

func TestGetCryOfEuropeanParrot(t *testing.T) {
	parrot := CreateParrot(TypeEuropean, 0, 0, false)
	cry, err := parrot.Cry()
	assert.Equal(t, "Sqoork!", cry)
	assert.NoError(t, err)
}

func TestGetCryOfAfricanParrot(t *testing.T) {
	parrot := CreateParrot(TypeAfrican, 2, 0, false)
	cry, err := parrot.Cry()
	assert.Equal(t, "Sqaark!", cry)
	assert.NoError(t, err)
}

func TestGetCryNorwegianBlueParrot_high_voltage(t *testing.T) {
	parrot := CreateParrot(TypeNorwegianBlue, 0, 4, false)
	cry, err := parrot.Cry()
	assert.Equal(t, "Bzzzzzz", cry)
	assert.NoError(t, err)
}

func TestGetCryNorwegianBlueParrot_no_voltage(t *testing.T) {
	parrot := CreateParrot(TypeNorwegianBlue, 0, 0, false)
	cry, err := parrot.Cry()
	assert.Equal(t, "...", cry)
	assert.NoError(t, err)
}
