//
//  Cart.swift
//  swift-shopping-cart
//
//  Created by James Campagno on 9/26/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Cart {
    var items = [Item]()
    
    func totalPriceInCents() -> Int {
        var total = 0
        
        for item in items {
            total += item.priceInCents
        }
        
        return total
    }
    
    func add(item: Item) {
        items.append(item)
    }
    
    func remove(item: Item) {
        if let index = items.index(of: item) {
            items.remove(at: index)
        }
    }
    
    func items(withName name: String) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.name == name {
                matches.append(item)
            }
        }
        
        return matches
    }
    
    func items(withMinPrice price: Int) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.priceInCents >= price {
                matches.append(item)
            }
        }
        
        return matches
    }
    
    func items(withMaxPrice price: Int) -> [Item] {
        var matches = [Item]()
        
        for item in items {
            if item.priceInCents <= price {
                matches.append(item)
            }
        }
        
        return matches
    }
}
