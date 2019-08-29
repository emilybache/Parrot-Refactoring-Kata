#include "Parrot.h"


Parrot::Parrot(ParrotType parrotType, int numberOfCoconuts, double voltage, bool isNailed)
: parrotType(parrotType), numberOfCoconuts(numberOfCoconuts), voltage(voltage), isNailed(isNailed) {}

double Parrot::getSpeed() {
    return 12.0;
}