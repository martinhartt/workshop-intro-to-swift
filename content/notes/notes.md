### Why Swift?

Swift is *the* modern language for Apple platforms. Objective-C was, for a long time, the de facto language for Apple platforms. Now many software shops are not writing any new Objective-C code, in favour of writing all new code in Swift. The vast majority of Swift code is written for iOS and MacOS but its reach doesn't end there. I want to show you today that Swift is a **powerful** and **usable** general-purpose programming language that is not constrained to Apple platforms.

Swift is open source. You can find the [compiler](https://github.com/apple/swift), [standard library](https://github.com/apple/swift/tree/master/stdlib/public/core) and [core libraries](https://github.com/apple/swift-corelibs-foundation) on GitHub. Proposals for changes are also open to all. If you choose to, you can participate in the process of shpaing the future of this language.

If you're interested in mobile app development then you'll need to keep an eye on Swift but even outside of that context Swift is a great example of a modern programming language. Learning Swift may help you understand many other languages from which it draws inspiration.

### What we will cover

- Swift basic syntax
- Stand-out Swift features
- Swift package manager

### Reference

Use the [Swift Standard Library Documentation](https://developer.apple.com/documentation/swift) to quickly look up the various Swift data structures and APIs.

## Running Swift
Let's start by making sure we can run Swift

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

## Basic syntax

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

`switch` statements allow us to branch our code based on the values of a variable or expression. Note that `break` is optional.

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

We can define functions with the `func` keyword. The arguments and return types are required. If a function does not return a value, don't give a return type.

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

Structs are similar to classes

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

If we do not provide an initialiser, we get a **default initialiser** for free that simply takes values for all the stored properties and assigns them:

```swift
struct Instructor {
  let name: String
  var module: String
  func teach() {
    ...
  }
}

let hal = Instructor(name: "Hal", module: "Swift")
hal.teach()

```
So what's the difference between Structs and Classes?

- Classes are 'reference types', structs are 'value types'. See here for a thorough explanation: [https://developer.apple.com/swift/blog/?id=10](https://developer.apple.com/swift/blog/?id=10)
- Classes have additional features:
  - Inheritance (`struct`s can use `protocol`s, something we'll discuss later)
  - Type casting
  - Deinitializers

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

```java
// Some other language...
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

Failure to do this check can result in a `NullPointerException`. These are bugs we might not catch before we ship our code:

```java
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

#### Working with Optionals

```swift
let richardsLove: TrueLove? = nil

```

We can define default values with the `??` operator. In the following example, when `richardsLove` doesn't exist, it will assign `TrueLove("Taylor Swift")`.

```swift

let definiteLove =
richardsLove ?? TrueLove("Taylor Swift")
// richardsLove: TrueLove (non-optional)
```

If we are 100% totally sure the optional isn't `nil`, we can **force unwrap** with `!`.

```swift

let definiteLove = richardsLove!
// For when you can be sure that the value will be there
// Note that in this case this is a runtime error!
```

What if we wanted to get the name of `richardsLove`? Of ocurse this is also an optional value since Richard may not have a true love. We can't just say `richardsLove.name` since `richardsLove` could be `nil` and `nil` doesn't know how to deal with `name`. This is where **optional chaining** comes in. 

```
let richardsLoveName = richardsLove?.name
```
With the inclusion of that little question mark, this will evaluate to `nil` if `richardsLove` is `nil`, and the name of the `TrueLove` otherwise. 

Now say for some reason we wanted to get the *middle* name of Richard's true love and then convert to lowercase. Richard might not have a true love, his true love might not have a middle name, but optional chaining has us covered:

```
let loverMiddleName = richardsLove?.middleName?.lowercased()
```

If Richard doesn't have a true love, *or* if he does but they don't have a middle name, then a 'link in the chain' is missing and the whole expression evaluates to nil. Otherwise we get the value we wanted.
