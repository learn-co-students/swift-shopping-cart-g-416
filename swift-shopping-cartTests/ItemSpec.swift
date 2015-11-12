//  ItemSpec.swift

import Quick
import Nimble
@testable import swift_shopping_cart

class ItemSpec: QuickSpec {
    override func spec() {
        describe("Item") {
            describe("initializer") {
                it("sets name to 'pizza' and priceInCents to 599") {
                    let pizza = Item(name: "pizza", priceInCents: 599)
                    
                    expect(pizza.name).to(match("pizza"))
                    expect(pizza.priceInCents).to(equal(599))
                }
                
                it("sets name to 'coffee' and priceInCents to 317") {
                    let coffee = Item(name: "coffee", priceInCents: 317)
                    
                    expect(coffee.name).to(match("coffee"))
                    expect(coffee.priceInCents).to(equal(317))
                }
            }
            
            let coffee0 = Item(name: "coffee", priceInCents: 317)
            let coffee1 = Item(name: "coffee", priceInCents: 317)
            let artisanCoffee = Item(name: "coffee", priceInCents: 550)
            let icedTea = Item(name: "iced tea", priceInCents: 317)
            
            describe("equality function") {
                it("returns true for two equal coffee items") {
                    expect(coffee0 == coffee1).to(beTrue())
                }
                
                it("returns false for two coffee items with different prices") {
                    expect(coffee0 == artisanCoffee).to(beFalse())
                }
                
                it("returns false for two items with different names but the same price") {
                    expect(coffee0 == icedTea).to(beFalse())
                }
                
                it("returns false for two items that are nothing alike") {
                    expect(artisanCoffee == icedTea).to(beFalse())
                }
            }
        }
    }
}


