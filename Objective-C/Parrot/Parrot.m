#import "Parrot.h"

@implementation Parrot {
    ParrotTypeEnum _type;
    NSInteger _numberOfCoconuts;
    double _voltage;
    BOOL _nailed;
}

- (instancetype)initWithType:(ParrotTypeEnum)type numberOfCoconuts:(NSInteger)numberOfCoconuts voltage:(double)voltage nailed:(BOOL)nailed {
    if ((self = [super init])) {
        _type = type;
        _numberOfCoconuts = numberOfCoconuts;
        _voltage = voltage;
        _nailed = nailed;
    }
    return self;
}

- (double)speed {
    switch(_type) {
        case ParrotTypeEnumEuropean:
            return self.baseSpeed;
            
        case ParrotTypeEnumAfrican:
            return MAX(0.0, self.baseSpeed - self.loadFactor * _numberOfCoconuts);
            
        case ParrotTypeEnumNorwegianBlue:
            return (_nailed) ? 0 : [self baseSpeed:_voltage];
    }
    @throw [NSException exceptionWithName:@"Should be unreachable" reason:nil userInfo:nil];
}

- (double)baseSpeed:(double)voltage {
    return MIN(24.0, voltage*self.baseSpeed);
}

- (double)loadFactor {
    return 9.0;
}

- (double)baseSpeed {
    return 12.0;
}

@end
