
import Foundation

extension NumberFormatter {

    public var fractionDigits: ClosedRange<Int> {
        set {
            minimumFractionDigits = newValue.lowerBound
            maximumFractionDigits = newValue.upperBound
        }
        get {
            ClosedRange(uncheckedBounds: (minimumFractionDigits, maximumFractionDigits))
        }
    }

    public var integerDigits: ClosedRange<Int> {
        set {
            minimumIntegerDigits = newValue.lowerBound
            maximumIntegerDigits = newValue.upperBound
        }
        get {
            ClosedRange(uncheckedBounds: (minimumIntegerDigits, maximumIntegerDigits))
        }
    }

    public var significantDigits: ClosedRange<Int> {
        set {
            minimumSignificantDigits = newValue.lowerBound
            maximumSignificantDigits = newValue.upperBound
        }
        get {
            ClosedRange(uncheckedBounds: (minimumSignificantDigits, maximumSignificantDigits))
        }
    }
}

extension ClosedRange: ExpressibleByIntegerLiteral where Bound == Int {

    public init(integerLiteral value: Int) {
        self = value...value

    }
}
