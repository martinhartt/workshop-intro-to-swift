/// Here we define some functions that will allow us to easily accept input 
/// from the user on the command line

func readLatitude() -> Double {
  // Keep looping until we get a valid latitude
  while(true) {
    print("Enter your latitude: ")

    // readLine() returns nil if the input ends before a newline is reached.
    // In our case we cannot recover from this, we need the input!
    // So here is a case where it makes sense to 'force unwrap' and crash when
    // this happens. For a more elegant failure option here, see the 'Error
    // handling' section of 'The Swift Programming Language'

    // Double has an initialiser which takes a string e.g. "0.1386" and returns
    // the actual number (e.g. 0.1386) or nil if the string doesn't correspond
    // to a number. Notice the optional binding
    if let latitude = Double(readLine()!) {
      return latitude
    } else {
      print("Invalid, please try again")
    }
  }
}

func readLongitude() -> Double {
  while(true) {
    print("Enter your longitude: ")
    if let longitude = Double(readLine()!) {
        return longitude
    } else {
      print("Invalid, please try again")
    }
  }
}

func readLocation() -> Location {
  // Here we call our two functions and pass the results directly as parameters
  // to the Location initialiser. Function arguments are evaluated in order
  // so the user will be prompted for latitude first
  return Location(
    latitude: readLatitude(),
    longitude: readLongitude()
  )
}

func readRequiresBabyChanging() -> Bool {
  while(true) {
    print("Do you require baby changing facilities? (N/y)")
    // Here we lowercase so that both "y" and "Y" has the same effect
    switch readLine()!.lowercased() {
    case "y": return true
    default: return false
    }
  }
}


enum Gender {
case male
case female
case unisex
}

func gender(from string: String) -> Gender? {
  switch string {
  case "male":
    return .male
  case "female":
    return .female
  case "unisex":
    return .unisex
  default:
    return nil
  }
}

func readGender() -> Gender {
  while true {
    print("Do you need male, female or unisex toilets?")
    if let input = readLine(), let gender = gender(from: input) {
      return gender
    }
    print("Invalid option, please try again")
  }
}


func readShowFreeOnly() -> Bool {
  while(true) {
    print("Show free toilets only? (Y/n)")
    if let responseString = readLine() {
      switch responseString.lowercased() {
      case "n": return false
      default: return true
      }
    }
  }
}
