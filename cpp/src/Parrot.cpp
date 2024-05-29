#include <stdexcept>
#include <algorithm>

#include "Parrot.h"

using namespace std;

Parrot::Parrot(ParrotType parrotType, int numberOfCoconuts, double voltage, bool isNailed)
    : parrotType(parrotType), numberOfCoconuts(numberOfCoconuts), voltage(voltage), isNailed(isNailed) {
}

double Parrot::getSpeed() {
    switch (parrotType) {
        case EUROPEAN:
            return getBaseSpeed();
        case AFRICAN:
            return max(0.0, getBaseSpeed() - getLoadFactor() * numberOfCoconuts);
        case NORWEGIAN_BLUE:
            return (isNailed) ? 0 : getBaseSpeed(voltage);
        default:
            throw std::invalid_argument("Should be unreachable");
    }
}

const string Parrot::getCry() {
    std::string cry;
    switch (parrotType) {
        case EUROPEAN:
            return "Sqoork!";
        case AFRICAN:
            return "Squaark!";
        case NORWEGIAN_BLUE:
            return (voltage > 0) ? "Bzzzzzz" : "...";
        default:
            throw std::invalid_argument("Should be unreachable");
    }
}

double Parrot::getBaseSpeed() {
    return 12.0;
}

double Parrot::getLoadFactor() {
    return 9.0;
}

double Parrot::getBaseSpeed(double current_voltage) {
    return min(24.0, current_voltage * getBaseSpeed());
}
