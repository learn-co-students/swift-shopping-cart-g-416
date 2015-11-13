//  Cart.swift

import Foundation

class Cart {
    var items = [Item]()
    
    func calculateTotalPriceInCents() -> Int {
        var totalPriceInCents = 0
        
        for item in items {
            totalPriceInCents += item.priceInCents
        }
        
        return totalPriceInCents
    }
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func removeItem(item: Item) {
        if let index = items.indexOf(item) {
            items.removeAtIndex(index)
        }
    }
        
    func allItemsWithName(name: String) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.name == name {
                matches.append(item)
            }
        }
        
        return matches
    }
    
    func allItemsWithMinimumPriceInCents(priceInCents: Int) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.priceInCents >= priceInCents {
                matches.append(item)
            }
        }
        
        return matches
    }
    
    func allItemsWithMaximumPriceInCents(priceInCents: Int) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.priceInCents <= priceInCents {
                matches.append(item)
            }
        }
        
        return matches
    }
}

