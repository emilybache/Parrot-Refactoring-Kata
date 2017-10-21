//
//  ParrotTests.swift
//  ParrotTests
//
//  Created by Ivan Rublev on 10/21/17.
//

import XCTest

class ParrotTests: XCTestCase {
    func testSpeedOfEuropeanParrot() {
        let parrot = Parrot(.european, numberOfCoconuts: 0, voltage: 0.0, isNailed: false);
        XCTAssertEqual(parrot.speed, 12.0)
    }
}
