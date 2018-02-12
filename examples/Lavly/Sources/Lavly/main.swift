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
// TODO #3: Uncomment this
// let requireBabyChanging = readRequiresBabyChanging()

// TODO #5: Set a constant called 'showFreeOnly' to the value returned by the
// readShowFreeOnly() function

     
     

let requestedGender = readGender() 
    
print("Searching toilets...")
print("Location: (\(currentLocation.latitude), \(currentLocation.longitude))")
// print("Requires baby changing facilities: \(requireBabyChanging)")
// print(showFreeOnly ? "Showing free toilets only" : "Showing free and paid toilets")
print()

// MARK: Retrieve and order results

var toilets = cambridgeToilets

// TODO #7:
// Using what you know about the filter method on Array,
// if the user only wants to see free toilets, filter out the toilets that aren't free.

// TODO #8: 
// If the user requires baby changing facilities, filter the toilets array appropriately.

// TODO #8.5:
// Filter the toilets to only include those which support the requested gender.
// Hint: https://developer.apple.com/documentation/swift/array/2945493-contains

// TODO #9: 
// Using what you know about closures in Swift, read about the `sorted(by: )` method on Array:
// https://developer.apple.com/documentation/swift/array/2296815-sorted
// See if you can use this to sort by the distance to the current location
// using your distance(to: ) function on Location

// MARK: Display results

for toilet in toilets {
  print(toilet.name)

  // TODO #10:
  // Read about 'String interpolation' here: 
  // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID292
  // (It's a nice way to format strings!)
  // Use it to make the list of results prettier and more useful,
  // perhaps by providing the distance and location!

  print()
}
