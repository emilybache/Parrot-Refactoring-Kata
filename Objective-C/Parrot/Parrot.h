#import <Foundation/Foundation.h>
#import "ParrotTypeEnum.h"

@interface Parrot : NSObject
- (instancetype)initWithType:(ParrotTypeEnum)type numberOfCoconuts:(NSInteger)numberOfCoconuts voltage:(double)voltage nailed:(BOOL)nailed;
- (double)speed;
@end
