### Why Swift?

- Apple platforms
- ...but not just Apple platforms
- Open source (swift.org)
- Young language, you can shape its future
- Employable skill

### What we will cover

- Swift outside of the Apple context
- Swift basic syntax
- Great Swift features
- Swift package manager

### Reference

Use the [Swift Standard Library Documentation](https://developer.apple.com/documentation/swift) to quickly look up the various Swift data structures and APIs.

## Running Swift

### REPL mode

Runs a 'read, evaluate, print' loop.

```bash
$ swift
```

### Interpreted mode

File is read and executed line-by-line.

```bash
$ swift test.swift
```

### Compiled mode

The swift file is compiled into a native executable.

```bash
$ swiftc test.swift -o test
$ ./test
```

## Some syntax

Semicolons are optional 😉

### Values

Values are constant variables which never change value (are immuatable). They are defined with the `let` keyword.
```swift
let name = "Richard"
// name = "Hal" <- This would fail!
```

### Variables

Variables store values which can be changed (are mutable). They are defined with `var`.
```swift
var otherName = "Richard"
otherName = "Hal" // This succeeds
```

### Explicitly declaring type

We can define the type explicitly which constraints the value/variable to the type.
```swift
let title: String
title = "Mr"
```

### Control Flow

In other language such as Java, we would use a `for` construct.
```
for (int i = 0; i < n; i++) {
  // Use i
}
```

In Swift, we utilise the native ranges, which expresses loops in a more concise and expressive way.
```swift
for i in 0 ..< n {
  // Use i
}
```

Enums allow us to branch our code based on the values of a variable or expression. Note that `break` is optional.

```swift
let favouriteFood: String
// set favouriteFood

switch favouriteFood {
  case "salad":
    print("Nobody likes a liar")
  case "candy floss":
    print("You’ve a sweet tooth")
  default:
    print("Great choice!")
}
// Note these cases cover all possibilities
```

Default cases are required when all the possible cases aren't specified.

```swift
let favouriteFood: String
// set favouriteFood

switch favouriteFood {
  case "salad":
    print("Nobody likes a liar")
  case "candy floss":
    print("You’ve a sweet tooth")
}
// error: switch must be exhaustive, consider adding a default clause
```

### Functions

We can define function with the `func` keyword. The types of the arguments and return are required.

```swift
func isOne(number: Int) -> Bool {
  return number == 1
}

```

## Classes, Structures, Enumerations

### Classes

A class is like a template for an object. We define one with the `class` keyword.
Classes can contain properties (values, variables) and methods (functions).
`init` is a special method which defines the constructor.

```swift
class Student {
  let name: String
  var triposPart: String

  func read() {
    ...
  }

  init(name: String, triposPart: String) {
    self.name = name
    self.triposPart = triposPart
  }
}

let richard = Student(name: "Richard", triposPart: "1B")
richard.read()
```

### Structures

Structs are equivalent to classes, except that they are copied rather than passed by reference.

```swift
struct Instructor {
  let name: String
  var module: String

  init(name: String, lecturingIn module: String) {
    self.name = name
    self.module = module
  }

  func teach() {
    ...
  }
}

let hal = Instructor(name: "Hal", lecturingIn: "Swift")
hal.teach()

```

EDITORS NOTE: We should remove the init as it is generated automatically for structs


### Extensions

Extensions allow us to add additional methods to existing classes, structs and enums.

```swift
extension String {
  func isPalindrome() -> Bool {
    return self == String(self.characters.reversed())
  }
}

// "hello".isPalindrome() == false
// "racecar".isPalindrome() == true
```

### Enumerations

For types which have a fixed set of possible values, we can define each value with constants.

```swift
let SUIT_SPADES   = 0
let SUIT_CLUBS    = 1
let SUIT_HEARTS   = 2
let SUIT_DIAMONDS = 3

let aceOfSpadesSuit = SUIT_SPADES
// Yucky!
```

However, this is not very swift-y, as the `enum` construct lets us define these types.

```swift
enum CardSuit {
  case spades, clubs, hearts, diamonds
}

let aceOfSpadesSuit = CardSuit.spades
```

We can add additional methods to enums, which is most suited for functions related to that type.

```swift
enum CardSuit {
  case spades, clubs, hearts, diamonds

  func suitName() -> String {
    switch self {
      case CardSuit.spades:
        return "Spades"
      case CardSuit.clubs:
        return "Clubs"
      case CardSuit.hearts:
        return "Hearts"
      case CardSuit.diamonds:
        return "Diamonds"
      }
  }
}

// Note no default case
// but compiler knows that this covers all cases
// so doesn’t complain
```

The Swift compiler is smart enough to infer a type for the enums.

```swift
enum CardSuit {
  case spades, clubs, hearts, diamonds

  func suitName() -> String {
    switch self {
      case .spades: // <- Note didn't write 'CardSuit'
        return "Spades"
      case .clubs:
        return "Clubs"
      case .hearts:
        return "Hearts"
      case .diamonds:
        return "Diamonds"
    }
  }
}
```

We can also associate values with cases.

```swift

enum Price {
  case value(Int)
  case unconfirmed

  func description() -> String {
    switch self {
      case .value(let x):
        return "Price is \(x) pence"
      case .unconfirmed:
        return "See the blackboard for the price"
      }
    }
}

let caviarPrice = Price.value(2300)
let soupOfTheDayPrice = Price.unconfirmed
...
```

### Optionals

In most other languages, any variable can potentially be optional (i.e. containing `null`).

```
TrueLove richardsLove = null
...
// Remember to check for null
if (richardsLove == null) {
  // Do nothing
} else {
  // sendRoses expects TrueLove param
  sendRoses(richardsLove)
}

```

This can result in a few `NullPointerException`s, which are annoying to debug.

```swift
TrueLove richardsLove = null
...
// forget to check for null
// sendRoses expects TrueLove param
sendRoses(richardsLove)
// compiler will let you do this
// but it will catch fire at runtime!
```

In Swift, we define that a variable can be optional with a `?` next to the type.
Optionals can be safely used with the `if let` construct, where the body is run only when the variable isn't `nil`.

```swift
let richardsLove: TrueLove? = nil

// sendRoses expects TrueLove param
// Do an ‘optional binding’
if let recipient = richardsLove {
  sendRoses(to: recipient)
}
```

### Working with Optionals

```swift
let richardsLove: TrueLove? = nil

```

We can define default values with the `??` operator. In this example, when `richardsLove` doesn't exist, it will assign `TrueLove("Taylor Swift")`.
```swift

let definiteLove =
richardsLove ?? TrueLove("Taylor Swift")
// richardsLove: TrueLove (non-optional)
```

If we are 100% totally sure the optional isn't `nil`, we can force unwrap with `!`.

```swift

let definiteLove = richardsLove!
// For when you can be sure that the value will be there
// Note that in this case this is a runtime error!
```
