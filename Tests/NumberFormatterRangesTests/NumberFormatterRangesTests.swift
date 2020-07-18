
import Foundation
import NumberFormatterRanges
import XCTest

final class NumberFormatterRangesTests: XCTestCase {

    func testRange() {
        let formatter = NumberFormatter()
        formatter.fractionDigits = 2...4
        XCTAssertEqual(formatter.string(from: 0.1), "0.10")
        XCTAssertEqual(formatter.string(from: 0.123456789), "0.1235")

    }

    func testNumber() {
        let formatter = NumberFormatter()
        formatter.fractionDigits = 3
        XCTAssertEqual(formatter.string(from: 0.123456789), "0.123")
    }
}
