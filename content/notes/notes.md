### Why Swift?

Swift is designed to be:
> a programming language to empower everyone to turn their ideas into apps on any platform.


Swift was designed by Apple and has taken over (from Objective-C) as the go-to language for programming Apple platforms. Whilst the vast majority of Swift code is written for iOS and MacOS, its reach doesn't end there. I want to show you today that Swift is a **powerful** and **usable** general-purpose programming language that is not constrained to Apple platforms.

Swift is open source. That is to say, anybody can contribute to its development by filing issues, proposing new features and changes, and by directly contributing code. You can find the [compiler](https://github.com/apple/swift), [standard library](https://github.com/apple/swift/tree/master/stdlib/public/core) and [core libraries](https://github.com/apple/swift-corelibs-foundation) on GitHub. If you choose to, you can participate in the process of shaping the future of this young language.

If you're interested in mobile app development then Swift programming is an essential skill right now but even outside of that context Swift is a great example of a modern programming language. Learning Swift may help you understand many other languages from which it draws inspiration.

### What we will cover

- Swift basic syntax
- Stand-out Swift features
- Building an example app

This workshop covers most of the content of the 'A Swift Tour' section of [The Swift Programming Language](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/index.html). This is the go-to resource for learning the interesting bits of Swift and if you're interested in learning more then that should be your first stop.

### References

Most of the time when you write Swift, you are using a combination of:

- built in Swift features (e.g. `Array`s)
- Swift Standard Library features (e.g. Sorting `Array`s)
- `Foundation` library features (e.g. Separating a `String` by, say, commas)



If you're on a Mac, Xcode is the best way of reading the documentation for these things. Open Xcode and go to Help > Developer Documentation and you can search for what you need.

If you're not on a Mac, it can be tricky to find the right docs though they are online:

- [Swift Standard Library Documentation](https://developer.apple.com/documentation/swift)
- [Foundation Documentation](https://developer.apple.com/documentation/foundation)

In practice, Google is usually a quicker way to find the information you need.

## Getting started
To follow along with this workshop, you'll need to clone the example repository:

```bash
$ git clone https://github.com/hackersatcambridge/workshop-intro-to-swift
Cloning into workshop-intro-to-git...
$ cd workshop-intro-to-git/examples
```

### Running Swift
Let's start by making sure we can run Swift

#### REPL mode

Runs a 'read, evaluate, print' loop. Type instructions and press enter to run them. Note that this mode may not work in Linux containers (but should do on native Linux machines).

```bash
$ swift
```

#### Interpreted mode

File is read and executed line-by-line.

```bash
$ swift test.swift
```

#### Compiled mode

The swift file is compiled into a native executable.

```bash
$ swiftc test.swift -o test
$ ./test
```

## Basic syntax

### Semicolons

Unlike other languages, semicolons are optional and generally not preffered.

### Values

Values are constant variables which never change value (are immutable). They are defined with the `let` keyword.
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

```java
for (int i = 0; i < n; i++) {
  // Use i
}
```

In Swift, we utilise the native ranges, which defines loops in a more concise and expressive way.

```swift
for i in 0 ..< n {
  // Use i
}
```

`switch` statements allow us to branch our code based on the values of a variable or expression. 

Note that the `break` keyword is optional, as it is automatically inserted at the end of every case. 

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

We can combine ranges and `switch` statements to check if a value is in a certain range:

```swift
let yourAge: Int = 20 // Set this to be your age

switch yourAge {
  case 0: // This will only match the number 0 
    print("You are a baby")
  case 1 ... 3: // This will match numbers 1, 2 and 3.
    print("You are a toddler")
  case 4 ... 11:
    print("You are a child")
  case 12 ..< 18: // Here we are checking for a range which is >= 12, but < 18.
    print("You are a teenager")
  case 18 ...: // As no upper bound is specified, this matches all >= 18
    print("You are an adult")
  default: // For cases when there is a negative number
    print("You can't have a negative age")
}

```

### Functions

We can define functions with the `func` keyword. The arguments and return types are required. If a function does not return a value, don't specify a return type.

```swift
func isOne(number: Int) -> Bool {
  return number == 1
}

```

## Guard Statements

Whilst we're talking about control flow, I want to show you an example of where Swift's type system makes life a lot easier for us sometimes.

```swift
guard(divisor != 0) else {
  print("Can't divide by zero")
  return
}
print(5 / divisor)
return
```

*Guard statements* are like if statements but instead of executing the code inside the block when the condition *does* hold, a `guard` statement makes sure that the condition holds and then runs the code inside the block otherwise.

Here's the cool bit: the type system will make sure that the else block either never terminates or it gets us out of the current scope. In this case, that has been done with a `return` but it could have been done by `throw`ing an error or  `break`ing or `continue`ing out of a current loop iteration.

Why can't we just use an `if`?

```
if(divisor == 0) {
  print("Can't divide by zero")
}
print(5 / divisor)
return
```
Whoops! We forgot to return early when we recognised the 0. This compiles just fine but then crashes at runtime. With guard on the other hand:

```
guard(divisor != 0) else {
  print("Can't divide by zero")
}
print(5 / divisor)
return

// error: 'guard' body may not fall through, consider using a 'return' or 'throw' to exit the scope
```
The compiler has caught this for us and saved us from another runtime error. Hooray!

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

Structs are similar to classes:

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

### Protocols
Protocols let us define a set of requirements that other types can declare conformance too. For example, the [standard library](https://github.com/apple/swift/blob/master/stdlib/public/core/Equatable.swift#L167) includes an `Equatable` protocol:

```swift
public protocol Equatable {
  static func == (lhs: Self, rhs: Self) -> Bool
}
```

This protocol has only one requirement, the static equality function. The built in [`Int`](https://developer.apple.com/documentation/swift/int) type conforms to this protocol and that's why we can do this:

```swift
4 == (2 + 2)
// true
```

We can make our own types conform to `Equatable` simply by providing that one static method and *declaring conformance* with "`: Equatable`":

```swift
struct Instructor: Equatable {
  let name: String
  var module: String
  static func == (lhs: Instructor, rhs: Instructor) -> Bool {
  	return lhs.name == rhs.name && lhs.module == rhs.module
  }
}
```
And now we can compare two `Instructor`s with `==`

Protocols are more powerful than they first appear:

- Types can conform to multiple protocols
- Extensions on protocols allow you to define default behaviours for types that conform to the protocol
- Protocols can conform to other protocols
- *Value* types (such as `struct`s) can conform to protocols, as we've just seen

With all these features, [Protocol-Oriented Programming](https://m.youtube.com/watch?v=g2LwFZatfTI) is a real alternative (or accompaniment) to Obect-Oriented Programming that can make for simpler code. 
