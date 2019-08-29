#ifndef PARROT_PARROT_H
#define PARROT_PARROT_H

enum ParrotType { European, African, NorwegianBlue};

class Parrot {
public:
    Parrot(ParrotType parrotType, int numberOfCoconuts, double voltage, bool isNailed);

    double getSpeed();
private:
    ParrotType parrotType;
    int numberOfCoconuts;
    double voltage;
    bool isNailed;

};


#endif //PARROT_PARROT_H
