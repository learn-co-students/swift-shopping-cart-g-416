//  Cart.swift

import Foundation

class Cart {
    var items = [Item]()
    
    func totalPriceInCents() -> Int {
        var total = 0
        
        for item in items {
            total += item.priceInCents
        }
        
        return total
    }
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func removeItem(item: Item) {
        if let index = items.indexOf(item) {
            items.removeAtIndex(index)
        }
    }
        
    func itemsWithName(name: String) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.name == name {
                matches.append(item)
            }
        }
        
        return matches
    }
    
    func itemsWithMinimumPriceInCents(priceInCents: Int) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.priceInCents >= priceInCents {
                matches.append(item)
            }
        }
        
        return matches
    }
    
    func itemsWithMaximumPriceInCents(priceInCents: Int) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.priceInCents <= priceInCents {
                matches.append(item)
            }
        }
        
        return matches
    }
}

