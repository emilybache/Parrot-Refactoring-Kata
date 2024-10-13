@testable import Parrot
import XCTest

class ParrotTests: XCTestCase {
    func testSpeedOfEuropeanParrot() throws {
        let parrot = Parrot(.european, numberOfCoconuts: 0, voltage: 0.0, isNailed: false)
        XCTAssertEqual(parrot.speed(), 12.0)
    }

    func testSpeedOfAfricanParrot_with_one_coconut() throws {
        let parrot = Parrot(.african, numberOfCoconuts: 1, voltage: 0.0, isNailed: false)
        XCTAssertEqual(parrot.speed(), 3.0)
    }

    func testSpeedOfAfricanParrot_with_two_coconuts() throws {
        let parrot = Parrot(.african, numberOfCoconuts: 2, voltage: 0.0, isNailed: false)
        XCTAssertEqual(parrot.speed(), 0.0)
    }

    func testSpeedOfAfricanParrot_with_no_coconuts() throws {
        let parrot = Parrot(.african, numberOfCoconuts: 0, voltage: 0.0, isNailed: false)
        XCTAssertEqual(parrot.speed(), 12.0)
    }

    func testSpeedOfNorwegianBlueParrot_nailed() throws {
        let parrot = Parrot(.norwegianBlue, numberOfCoconuts: 0, voltage: 0.0, isNailed: true)
        XCTAssertEqual(parrot.speed(), 0.0)
    }

    func testSpeedOfNorwegianBlueParrot_not_nailed() throws {
        let parrot = Parrot(.norwegianBlue, numberOfCoconuts: 0, voltage: 1.5, isNailed: false)
        XCTAssertEqual(parrot.speed(), 18.0)
    }

    func testSpeedOfNorwegianBlueParrot_not_nailed_high_voltage() throws {
        let parrot = Parrot(.norwegianBlue, numberOfCoconuts: 0, voltage: 4.0, isNailed: false)
        XCTAssertEqual(parrot.speed(), 24.0)
    }
}
