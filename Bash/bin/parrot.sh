#!/bin/bash

getBaseSpeed() {
    echo 12
}

getLoadFactor() {
    echo 9
}

float_min() {
    # bash does not provide floats, use bc for that
    if [ "$(echo "$1" "<=" "$2" | bc)" == "1" ]
    then
        echo "$1"
    else
        echo "$2"
    fi
}

getBaseSpeedWithVoltage() {
    voltage="$1"
    float_min 24 "$(echo "$voltage" "*" "$(getBaseSpeed)" | bc)"
}

int_max() {
    echo "$(($1 >= $2 ? $1 : $2))"
}

getSpeed() {
    parrotType="$1"
    numberOfCoconuts="$2"
    voltage="$3"
    isNailed="$4"

    case $parrotType in
        "european_parrot")
            printf "%.1f\n" "$(getBaseSpeed)"
            ;;
        "african_parrot")
            printf "%.1f\n" "$(int_max 0 "$(( $(getBaseSpeed) - $(getLoadFactor) * numberOfCoconuts ))" )"
            ;;
        "norwegian_blue_parrot")
            if [ "$isNailed" = "true" ]
            then
                printf "%.1f\n" 0
            else
                printf "%.1f\n" "$(getBaseSpeedWithVoltage "$voltage")"
            fi
            ;;
        *)
            echo "Should be unreachable"
            exit 1
            ;;
    esac
}

getSpeed "$1" "$2" "$3" "$4"
