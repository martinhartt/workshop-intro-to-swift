/// Represents a public toilet
struct Toilet {
  let name: String
  let location: Location
  let price: Int?
  let hasBabyChanging: Bool
  let radarKeyRequired: Bool
  let supportedGenders: [Gender]
}
