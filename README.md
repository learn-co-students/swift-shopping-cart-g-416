# Swift — Shopping Cart

## Objectives

1. Create a class file.
2. Create a property for a custom class.
3. Write methods on your custom class which utilize a custom type.

## Instructions

Open `swift-shopping-cart.xcworkspace` and navigate to the `Item.swift` file.

#### `Item.swift`

The `Item` class is already set up for you:

```swift
//  Item.swift

import Foundation

class Item: Equatable, CustomDebugStringConvertible {
    var name = ""
    var priceInCents = 0
    var debugDescription: String { return name }
    
    init(name: String, priceInCents: Int) {
        self.name = name
        self.priceInCents = priceInCents
    }
}


func ==(lhs: Item, rhs: Item) -> Bool {
    let sameName = lhs.name == rhs.name
    let samePrice = lhs.priceInCents == rhs.priceInCents
    
    return sameName && samePrice
}
```
You can see that it has two settable properties, a string called `name` and an integer called `priceInCents`. It's also written with an initializer that takes an argument for either property. 

The `debugDescription` property is set up as a "calculated property" which simply returns the name. This property is required for conformance with the `CustomDebugStringConvertible` protocol that customizes how the class is read by the debug tools.

You'll notice that the `Item` class also conforms to the `Equatable` protocol, and the class definition is accompanied by an override of the equality comparator `==` that determines whether two `Item`s are equal. This has the effect of allowing you to use the equality comparator `==` on two instances of the `Item` class (and allows access to various methods like `contains(_:)` that only make sense on arrays of equatable objects).

### `Cart.swift`

1. In a new file, create a new class named `Cart`.

2. Give it one property, an empty array of the `Item` Type named `items`.

#### Methods

1. Write a method named `totalPriceInCents()` that takes no arguments and returns an `Int`. This method should return the total cost of all the items in the `items` array.

2. Write a method named `addItem(_:)` that takes one argument of type `Item` and provides no return. This method should add the argument to the end of the `items` property array.

3. Write a method named `removeItem(_:)` that takes one argument of type `Item` and provides no return. This method should remove an instance from the `items` array that matches the argument item.

4. Write a method named `itemsWithName(_:)` that takes one string argument and returns an array of type `Item`. This method should collect all of the items in the `items` property array whose `name` property matches the submitted string argument.

5. Write a method named `itemsWithMinimumPriceInCents(_:)` that takes one integer argument and returns an array of type `Item`. This method should collect all of the items in the `items` property array whose `priceInCents` property is greater than or equal to the submitted integer argument.

6. Write a method named `itemsWithMaximumPriceInCents(_:)` that take one integer argument and return an array of type `Item`. The method should collect all of the items in the `items` property array whose `priceInCents` property is less than or equal to the submitted integer argument.

<a href='https://learn.co/lessons/swift-shopping-cart' data-visibility='hidden'>View this lesson on Learn.co</a>

