
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
}

extension ClosedRange: ExpressibleByIntegerLiteral where Bound == Int {

    public init(integerLiteral value: Int) {
        self = value...value

    }
}
