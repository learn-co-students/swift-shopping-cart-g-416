//  CartSpec.swift

import Quick
import Nimble
@testable import swift_shopping_cart

class CartSpec: QuickSpec {
    override func spec() {
        describe("Cart") {
            
            let 🍕 = Item(name: "🍕", priceInCents: 150)
            let 🌮 = Item(name: "🌮", priceInCents: 250)
            let 🌯 = Item(name: "🌯", priceInCents: 599)
            let 🍏 = Item(name: "🍏", priceInCents: 50)
            let 🍎 = Item(name: "🍎", priceInCents: 50)
            let 🍊 = Item(name: "🍊", priceInCents: 45)
            let 🍓 = Item(name: "🍓", priceInCents: 10)
            let 🧀 = Item(name: "🧀", priceInCents: 399)
            let 🍪 = Item(name: "🍪", priceInCents: 199)
            
            // duplicate items, equatable but not identical
            let 🍕2 = Item(name: "🍕", priceInCents: 150)
            let 🍏2 = Item(name: "🍏", priceInCents: 50)
            
            
            var emptyCart = Cart()
            var fullCart = Cart()
            var fruitCart = Cart()
            var appleCart = Cart()
            var junkFoodCart = Cart()
            
            beforeEach() {
                emptyCart = Cart()
                
                fullCart = Cart()
                fullCart.items = [🍕, 🌮, 🌯, 🍏, 🍎, 🍊, 🍓, 🧀, 🍪]
                
                fruitCart = Cart()
                fruitCart.items = [🍏, 🍎, 🍊, 🍓]
                
                appleCart = Cart()
                appleCart.items = [🍏, 🍎, 🍏2, 🍏]
                
                junkFoodCart = Cart()
                junkFoodCart.items = [🍕, 🌮,🍕2, 🍕, 🌮, 🌯, 🍕, 🍕2, 🌯]
            }
            
            
            describe("totalPriceInCents()") {
                it("should return 0 for an empty cart") {
                    let result = emptyCart.totalPriceInCents()
                    
                    expect(result).to(equal(0))
                }
                
                it("should return 1752 for a full cart") {
                    let result = fullCart.totalPriceInCents()
                    
                    expect(result).to(equal(1752))
                }
                
                it("should return 155 for a fruit cart") {
                    let result = fruitCart.totalPriceInCents()
                    
                    expect(result).to(equal(155))
                }
            }
            
            describe("add(item:)") {
                it("should add pizza to an empty cart") {
                    emptyCart.add(item: 🍕)
                    
                    expect(emptyCart.items).to(equal([🍕]))
                }
                
                it("should add another pizza to a full cart") {
                    fullCart.add(item: 🍕)
                    let expected = [🍕, 🌮, 🌯, 🍏, 🍎, 🍊, 🍓, 🧀, 🍪, 🍕]
                    
                    expect(fullCart.items).to(equal(expected))
                }
                
                it("should add cheese to a fruit cart") {
                    fruitCart.add(item: 🧀)
                    let expected = [🍏, 🍎, 🍊, 🍓, 🧀]
                    
                    expect(fruitCart.items).to(equal(expected))
                }
            }
            
            describe("remove(item:)") {
                it("should remove burrito from a full cart") {
                    fullCart.remove(item: 🌯)
                    let expected = [🍕, 🌮, 🍏, 🍎, 🍊, 🍓, 🧀, 🍪]
                    
                    expect(fullCart.items).to(equal(expected))
                }
                
                it("should remove orange from a fruit cart") {
                    fruitCart.remove(item: 🍊)
                    let expected = [🍏, 🍎, 🍓]
                    
                    expect(fruitCart.items).to(equal(expected))
                }
            }

            describe("items(withName:)") {
                it("should return an empty array when no matches are found cart") {
                    let result = emptyCart.items(withName: "🌯")
                    let expected = [Item]()
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing cheese from a full cart") {
                    let result = fullCart.items(withName: "🧀")
                    let expected = [🧀]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containg all of the green apples from an apple cart") {
                    let result = appleCart.items(withName: "🍏")
                    let expected = [🍏, 🍏2, 🍏]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the pizza from a junk food cart") {
                    let result = junkFoodCart.items(withName: "🍕")
                    let expected = [🍕, 🍕2, 🍕, 🍕, 🍕2]
                    
                    expect(result).to(equal(expected))
                }
            }
            
            describe("itemsWithMinimumPriceInCents(_:)") {
                it("should return an array containing all of the full cart's items that have a priceInCents greater than or equal to 151") {
                    let result = fullCart.items(withMinPrice: 151)
                    let expected = [🌮, 🌯, 🧀, 🍪]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents greater than or equal 150") {
                    let result = fullCart.items(withMinPrice: 150)
                    let expected = [🍕, 🌮, 🌯, 🧀, 🍪]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents greater than or equal to 251") {
                    let result = fullCart.items(withMinPrice: 251)
                    let expected = [🌯, 🧀]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents greater than or equal to 250") {
                    let result = fullCart.items(withMinPrice: 250)
                    let expected = [🌮, 🌯, 🧀]
                    
                    expect(result).to(equal(expected))
                }
            }
            
            describe("allItemsWithMaximumPriceInCents(_:)") {
                it("should return an array containing all of the full cart's items that have a priceInCents less than or equal to 149") {
                    let result = fullCart.items(withMaxPrice: 149)
                    let expected = [🍏, 🍎, 🍊, 🍓]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents less than or equal to 150") {
                    let result = fullCart.items(withMaxPrice: 150)
                    let expected = [🍕, 🍏, 🍎, 🍊, 🍓]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents less than or equal to 249") {
                    let result = fullCart.items(withMaxPrice: 249)
                    let expected = [🍕, 🍏, 🍎, 🍊, 🍓, 🍪]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents less than or equal to 250") {
                    let result = fullCart.items(withMaxPrice: 250)
                    let expected = [🍕, 🌮, 🍏, 🍎, 🍊, 🍓, 🍪]
                    
                    expect(result).to(equal(expected))
                }
            }
        }
    }
}


