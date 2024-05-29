#ifndef PARROT_PARROT_H
#define PARROT_PARROT_H

#include <string>
#include <memory>

using namespace std;

enum ParrotType { EUROPEAN, AFRICAN, NORWEGIAN_BLUE };

class Parrot {
public:
    Parrot(ParrotType parrotType, int numberOfCoconuts, double voltage, bool isNailed);

    double getSpeed();

    const string getCry();

private:
    ParrotType parrotType;
    int numberOfCoconuts;
    double voltage;
    bool isNailed;

    double getBaseSpeed(double voltage);

    double getLoadFactor();

    double getBaseSpeed();
};


#endif //PARROT_PARROT_H
