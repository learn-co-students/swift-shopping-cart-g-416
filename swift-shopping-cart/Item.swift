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

