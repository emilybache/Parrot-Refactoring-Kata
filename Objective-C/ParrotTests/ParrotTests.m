#import <XCTest/XCTest.h>
#import "Parrot.h"

@interface ParrotTests : XCTestCase
@end

@implementation ParrotTests

- (void)testSpeedOfEuropeanParrot {
    Parrot *parrot = [[Parrot alloc] initWithType:ParrotTypeEnumEuropean numberOfCoconuts:0 voltage:0.0 nailed:NO];
    XCTAssertEqual(parrot.speed, 12.0);
}

- (void)testSpeedOfAfricanParrot_with_one_coconut {
    Parrot *parrot = [[Parrot alloc] initWithType:ParrotTypeEnumAfrican numberOfCoconuts:1 voltage:0.0 nailed:NO];
    XCTAssertEqual(parrot.speed, 3.0);
}

- (void)testSpeedOfAfricanParrot_with_two_coconuts {
    Parrot *parrot = [[Parrot alloc] initWithType:ParrotTypeEnumAfrican numberOfCoconuts:2 voltage:0.0 nailed:NO];
    XCTAssertEqual(parrot.speed, 0.0);
}

- (void)testSpeedOfAfricanParrot_with_no_coconuts {
    Parrot *parrot = [[Parrot alloc] initWithType:ParrotTypeEnumAfrican numberOfCoconuts:0 voltage:0.0 nailed:NO];
    XCTAssertEqual(parrot.speed, 12.0);
}

- (void)testSpeedNorwegianBlueParrot_nailed {
    Parrot *parrot = [[Parrot alloc] initWithType:ParrotTypeEnumNorwegianBlue numberOfCoconuts:0 voltage:0.0 nailed:YES];
    XCTAssertEqual(parrot.speed, 0.0);
}

- (void)testSpeedNorwegianBlueParrot_not_nailed {
    Parrot *parrot = [[Parrot alloc] initWithType:ParrotTypeEnumNorwegianBlue numberOfCoconuts:0 voltage:1.5 nailed:NO];
    XCTAssertEqual(parrot.speed, 18.0);
}

- (void)testSpeedNorwegianBlueParrot_not_nailed_high_voltage {
    Parrot *parrot = [[Parrot alloc] initWithType:ParrotTypeEnumNorwegianBlue numberOfCoconuts:0 voltage:4.0 nailed:NO];
    XCTAssertEqual(parrot.speed, 24.0);
}

@end
