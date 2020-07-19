# NumberFormatterRanges

The following [tweet from Daniel Steinberg](https://twitter.com/dimsumthinking/status/1284570323954925574) got me thinking about the number formatter API.

>I mostly use the number formatter to set the fractional digits like this:
>
>f.minimumFractionDigits = 3
>
>f.maximumFractionDigits = 3
>
>why no f.fractionDigits computed property in the Swift overlay
>
>I know - not important in the scheme of all that is wrong in the world.

You could replace these two properties with one based on a `ClosedRange<Int>` instead:

```swift
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
```

This would allow you to set both in one line like so: `f.fractionDigits = 3...3`

However if `ClosedRange<Int>` where to also gain conformance to `ExpressibleByIntegerLiteral`

```swift
extension ClosedRange: ExpressibleByIntegerLiteral where Bound == Int {

    public init(integerLiteral value: Int) {
        self = value...value
    }
}
```

then you could also do `f.fractionDigits = 3` providing a single property to set the minimum and maximum or just a single value. It also removes the bounds checking out from `NumberFormatter` and using the existing checks in `ClosedRange` itself.

