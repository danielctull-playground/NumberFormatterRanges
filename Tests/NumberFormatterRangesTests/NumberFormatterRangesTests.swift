
import Foundation
import NumberFormatterRanges
import XCTest

final class NumberFormatterRangesTests: XCTestCase {

    func testFractionDigitsRange() {
        let formatter = NumberFormatter()
        formatter.fractionDigits = 2...4
        XCTAssertEqual(formatter.string(from: 0.1), "0.10")
        XCTAssertEqual(formatter.string(from: 0.123456), "0.1235")
    }

    func testFractionDigitsIntegerLiteral() {
        let formatter = NumberFormatter()
        formatter.fractionDigits = 3
        XCTAssertEqual(formatter.string(from: 0.1), "0.100")
        XCTAssertEqual(formatter.string(from: 0.123456), "0.123")
    }

    func testIntegerDigitsRange() {
        let formatter = NumberFormatter()
        formatter.integerDigits = 2...4
        XCTAssertEqual(formatter.string(from: 1), "01")
        XCTAssertEqual(formatter.string(from: 123456), "3456")
    }

    func testIntegerDigitsIntegerLiteral() {
        let formatter = NumberFormatter()
        formatter.integerDigits = 3
        XCTAssertEqual(formatter.string(from: 1), "001")
        XCTAssertEqual(formatter.string(from: 123456), "456")
    }

    func testSignificantDigitsRange() {
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = true
        formatter.significantDigits = 2...4
        XCTAssertEqual(formatter.string(from: 1), "1.0")
        XCTAssertEqual(formatter.string(from: 123456), "123500")
    }

    func testSignificantDigitsIntegerLiteral() {
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = true
        formatter.significantDigits = 3
        XCTAssertEqual(formatter.string(from: 1), "1.00")
        XCTAssertEqual(formatter.string(from: 123456), "123000")
    }
}
