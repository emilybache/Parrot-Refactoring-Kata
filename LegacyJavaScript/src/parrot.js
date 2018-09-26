/* global module */

var PARROT_TYPES = {
    EUROPEAN:       'EUROPEAN',
    AFRICAN:        'AFRICAN',
    NORWEGIAN_BLUE: 'NORWEGIAN_BLUE'
};

function Parrot(parrotType, numberOfCoconuts, voltage, isNailed) {
    'use strict';

    function getBaseSpeed() {
        return 12;
    }

    function getLoadFactor() {
        return 9;
    }

    function getBaseSpeedWithVoltage(voltage) {
        return Math.min(24, voltage * getBaseSpeed());
    }

    this.getSpeed = function() {
        switch (parrotType) {
        case PARROT_TYPES.EUROPEAN:
            return getBaseSpeed();
        case PARROT_TYPES.AFRICAN:
            return Math.max(0, getBaseSpeed() - getLoadFactor() * numberOfCoconuts);
        case PARROT_TYPES.NORWEGIAN_BLUE:
            return (isNailed) ? 0 : getBaseSpeedWithVoltage(voltage);
        }
        throw new Error("Should be unreachable");
    };

    return this;
}

module.exports = Parrot;
module.exports.TYPES = PARROT_TYPES;
