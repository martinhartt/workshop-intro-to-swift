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
  // Using what you know about optionals, make this function read a Double from
  // the command line. The readLatitude implementation above should help!

  // Delete this line
  fatalError("readLongitude is not yet implemented!") 
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


// TODO #4:
// Using what you know about switch statements, add a function
// readShowFreeOnly() similar to readRequiresBabyChanging that asks if the
// user wants to see only free toilets.