package parrot

import (
	"errors"
	"math"
)

type parrotType int

const (
	TypeEuropean      parrotType = 1
	TypeAfrican       parrotType = 2
	TypeNorwegianBlue parrotType = 3
)

// Parrot has a Speed and Cry.
type Parrot interface {
	Speed() (float64, error)
	Cry() (string, error)
}

type mixedParrot struct {
	_type            parrotType
	numberOfCoconuts int
	voltage          float64
	nailed           bool
}

func CreateParrot(t parrotType, numberOfCoconuts int, voltage float64, nailed bool) Parrot {
	return mixedParrot{t, numberOfCoconuts, voltage, nailed}
}

func (parrot mixedParrot) Speed() (float64, error) {
	switch parrot._type {
	case TypeEuropean:
		return parrot.baseSpeed(), nil

	case TypeAfrican:
		return math.Max(0, parrot.baseSpeed()-parrot.loadFactor()*float64(parrot.numberOfCoconuts)), nil

	case TypeNorwegianBlue:
		if parrot.nailed {
			return 0, nil
		}
		return parrot.computeBaseSpeedForVoltage(parrot.voltage), nil

	default:
		return 0, errors.New("should be unreachable")
	}
}

func (parrot mixedParrot) computeBaseSpeedForVoltage(voltage float64) float64 {
	return math.Min(24.0, voltage*parrot.baseSpeed())
}

func (parrot mixedParrot) loadFactor() float64 {
	return 9.0
}

func (parrot mixedParrot) baseSpeed() float64 {
	return 12.0
}

func (parrot mixedParrot) Cry() (string, error) {
	switch parrot._type {
	case TypeEuropean:
		return "Sqoork!", nil

	case TypeAfrican:
		return "Sqaark!", nil

	case TypeNorwegianBlue:
		if parrot.voltage > 0 {
			return "Bzzzzzz", nil
		}
		return "...", nil

	default:
		return "", errors.New("should be unreachable")
	}
}
