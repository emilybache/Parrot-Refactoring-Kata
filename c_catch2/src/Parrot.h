#include <stdbool.h>
typedef enum { EUROPEAN, AFRICAN, NORWEGIAN_BLUE } ParrotType;

typedef struct {
    ParrotType type;
    int numberOfCoconuts;
    float voltage;
    bool isNailed;
} Parrot;

extern void init_parrot(Parrot* parrot,
                        ParrotType type,
                        int numberOfCoconuts,
                        float voltage,
                        bool isNailed);
extern float get_speed(Parrot* parrot);
extern void get_cry(Parrot* parrot, char* cry);
