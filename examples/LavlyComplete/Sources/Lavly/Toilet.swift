/// Represents a public toilet
struct Toilet {
  enum Price: Equatable {
    case unknown
    case value(Int)

    // This function makes this enum conform to the Equatable protocol
    // This allows us to check if two prices are the same using `==`
    static func ==(lhs: Price, rhs: Price) -> Bool {
      switch (lhs, rhs) {
        case (.unknown, .unknown): return true
        case let (.value(x), .value(y)): return x == y
        default: return false
      }
    }
  }

  let name: String
  let location: Location
  let price: Price
  let hasBabyChanging: Bool
  let radarKeyRequired: Bool
}
