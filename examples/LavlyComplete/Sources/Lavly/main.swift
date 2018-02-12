// main.swift is the 'entry point' of projects built with 'Swift Package Manager'

/// MARK: Greeting
print("""
      .__   .-\".
   (o\\\"\\  |  |
      \\_\\ |  |
     _.---:_ |
    (\"-..-\" /
     \"-.-\" /
       /   |
       \"--\"  Welcome to Lavly!
""")

/// MARK: Collect search parameters

let currentLocation = readLocation()
let requireBabyChanging = readRequiresBabyChanging()
let showFreeOnly = readShowFreeOnly()
let requestedGender = readGender() 

print("Searching toilets...")
print("Location: (\(currentLocation.latitude), \(currentLocation.longitude))")
print("Requires baby changing facilities: \(requireBabyChanging)")
print(showFreeOnly ? "Showing free toilets only" : "Showing free and paid toilets")
print()

// MARK: Retrieve and order results

var toilets = cambridgeToilets

if showFreeOnly {
  toilets = toilets.filter { $0.price == 0 }
}

if requireBabyChanging {
  toilets = toilets.filter { $0.hasBabyChanging }
}
     
toilets = toilets.filter { $0.supportedGenders.contains(requestedGender) } 

toilets = toilets.sorted { currentLocation.distance(to: $0.location) < currentLocation.distance(to: $1.location) }

// MARK: Display results

for toilet in toilets {
  print("Distance: ", currentLocation.distance(to: toilet.location))
  print("\(toilet.name) at location: (\(toilet.location.latitude), \(toilet.location.longitude))")
  print()
}
