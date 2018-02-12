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
  // TODO #1:
  // Using what you know about optionals, fix this broken function.
  // It should check if there is an input string and also check if
  // the Double constructor returns a non-nil value.
  // If either of these values fail, print the string "Invalid, please try again".
  // Make sure to try it out with weird inputs (e.g. "hello"). It should not crash!
  // The readLatitude implementation above should help!

  while(true) {
    print("Enter your longitude: ")
    let input = readLine()!
    let longitude: Double? = Double(input)
    
    // How do we make longitude non-optional?
    
    return longitude
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

// TODO #2:
// Using what you know about switch statements, add a function
// readRequiresBabyChanging() that asks the user if they require baby-chainging
// facilities and then reads a line from the terminal. If that 
// line is "y" or "Y" then return true, otherwise return false
// What should be the return type of this function?


enum Gender {
case male
case female
case unisex
}

// TODO #4:
// Using what you know about switch statements, implement this function
// which returns a Gender given the user input string. If it doesn't match with
// any of the options, return nil.
func gender(from string: String) -> Gender? {
  return nil
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
